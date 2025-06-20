# frozen_string_literal: true

require 'English'
require_relative 'db_config'

namespace :db do
  desc 'Restore database from given dump'

  task restore: :environment do
    puts "File name in #{DbConfig::BACKUP_PATH}/ to restore:"
    db_dump = $stdin.gets.chomp

    filename = "#{DbConfig::BACKUP_PATH}/#{db_dump}"
    unless File.exist?(filename)
      puts "#{filename} does not exist."
      next
    end

    restore_cmd = "pg_restore -U #{DbConfig::CREDENTIALS[:username]} " \
                  "-h #{DbConfig::CREDENTIALS[:host]} " \
                  "-d #{DbConfig::CREDENTIALS[:db_name]} " \
                  "-F c #{filename}".freeze

    puts 'Restoring database...'
    system(restore_cmd)

    if $CHILD_STATUS.success?
      puts "Database restored from #{filename}."
    else
      puts 'Error occured.'
    end
  end
end
