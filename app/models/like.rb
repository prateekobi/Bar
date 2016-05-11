class Like < ActiveRecord::Base
  belongs_to :bar
  belongs_to :recipe

  validates_uniqueness_of :bar, scope: :recipe
end
