class Room < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true

  def to_param
    name
  end
end
