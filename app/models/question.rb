class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers

  validates :title, presence: true
  validates :description, presence: true
  validates :description, length: { minimum: 150 }
end
