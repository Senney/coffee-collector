class Roast < ApplicationRecord
  belongs_to :user

  enum :status, [ :resting, :grinding, :done ]
end
