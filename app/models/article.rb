class Article < ActiveRecord::Base
  belongs_to :user
  validates :body, length: { minimum: 100 }, presence: true
  validates :name, length: { minimum: 1 }, presence: true
end
