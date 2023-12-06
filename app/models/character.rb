class Character < ApplicationRecord
  belongs_to :player, class_name: "Player"
end