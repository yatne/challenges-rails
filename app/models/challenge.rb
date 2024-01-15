class Challenge < ApplicationRecord
  belongs_to :creator, class_name: "User"
end
