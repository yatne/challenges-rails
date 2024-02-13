class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :challenge
  belongs_to :entry_type
end
