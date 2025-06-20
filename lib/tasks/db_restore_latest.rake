# frozen_string_literal: true

require 'English'
require_relative 'db_config'

namespace :db do
  desc 'Restore the latest database dump'
  task restore_latest: :environment do
    backup_dir = DbConfig::BACKUP_PATH
    dumps = Dir.glob("#{backup_dir}/*.dump")

    abort "No dumps found in #{backup_dir}" if dumps.empty?

    latest_dump = dumps.max_by { |f| File.mtime(f) }
    puts "Restoring database from #{latest_dump}..."

    db_url = ENV.fetch("DATABASE_URL") do
      abort "DATABASE_URL not set"
    end

    restore_cmd = "pg_restore --clean --no-acl --no-owner " \
                  "--dbname='#{db_url}' " \
                  "-F c #{latest_dump}"

    system(restore_cmd)

    if $CHILD_STATUS.success?
      puts "✅ Successfully restored database from #{latest_dump}"
    else
      abort "❌ Restore failed"
    end
  end
end
