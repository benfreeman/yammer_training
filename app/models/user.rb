class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :articles
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  before_save :concat_full_name

  def concat_full_name
    self.full_name = self.first_name + ' ' + self.last_name
  end

  def self.admin?
    self.admin
  end
end
