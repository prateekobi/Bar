class Like < ActiveRecord::Base
  belongs_to :barmen
  belongs_to :recipe

  validates_uniqueness_of :barmen, scope: :recipe
end
