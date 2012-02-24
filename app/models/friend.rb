class Friend < ActiveRecord::Base
  belongs_to  :user
  has_many  :debits

  accepts_nested_attributes_for :debits

  def to_s
    self.name
  end
end
