class Property < ApplicationRecord
  belongs_to :game
  belongs_to :user, optional: true
end
