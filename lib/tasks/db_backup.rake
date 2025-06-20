# frozen_string_literal: true

require 'English'
require_relative 'db_config'

namespace :db do
  desc 'Create new database dump'
  task backup: :environment do
    timestamp = Time.zone.now.strftime('%d-%m-%Y_%H:%M')
    filename = "#{DbConfig::BACKUP_PATH}/db_backup[#{timestamp}].dump"

    FileUtils.mkdir_p(DbConfig::BACKUP_PATH)

    backup_cmd = "pg_dump -U #{DbConfig::CREDENTIALS[:username]} " \
                 "-h #{DbConfig::CREDENTIALS[:host]} " \
                 "-d #{DbConfig::CREDENTIALS[:db_name]} " \
                 "-F c -f #{filename}".freeze

    puts 'Creating DB backup...'
    system(backup_cmd)
    if $CHILD_STATUS.success?
      puts "#{filename} successfully created!"
    else
      puts 'Error occured.'
    end
  end
end
