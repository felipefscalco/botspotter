class Player < ApplicationRecord
  scope :offline, -> { where(online: false) }
  scope :online, -> { where(online: true).order(up_time: :desc ) }
end
