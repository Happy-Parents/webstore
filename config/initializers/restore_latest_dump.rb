# frozen_string_literal: true

if Rails.env.production? && ENV["RUN_DB_RESTORE"] == "true"
  Rails.logger.info "🚀 Running db:restore_latest from initializer..."
  puts "🚀 Running db:restore_latest from initializer..."

  begin
    Rake::Task.clear # потрібно, щоб не конфліктувало
    Rails.application.load_tasks
    Rake::Task["db:restore_latest"].invoke
  rescue => e
    Rails.logger.error "❌ Failed to restore DB: #{e.message}"
    puts "❌ Failed to restore DB: #{e.message}"
  end
end
