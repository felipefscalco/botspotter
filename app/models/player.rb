class Player < ApplicationRecord
    scope :offline, -> {where(online: false)}
end
