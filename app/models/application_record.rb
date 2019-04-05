class ApplicationRecord < ActiveRecord::Base
  SLUG_BLACK_LIST = %w[about admin api billing blog buy demo dev download email faq ftp help
                       imap mail me my pop pop3 pricing sftp shop smtp staging support wiki
                       ww www wwww].freeze

  self.abstract_class = true
end
