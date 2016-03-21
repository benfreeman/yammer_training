class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :articles
  validates :first_name, :last_name, :email,  presence: true
  validates :email, confirmation: true
  validates :email, uniqueness: true

  before_save :concat_full_name

  def concat_full_name
    self.full_name = self.first_name + ' ' + self.last_name
  end

  def admin?
    self.admin
  end
end
