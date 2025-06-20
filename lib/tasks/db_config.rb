# frozen_string_literal: true

module DbConfig
  CREDENTIALS = Rails.application.credentials[:db]
  BACKUP_PATH = 'db/backups'
end
