class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :timesheets
  belongs_to :role

  validates_presence_of :first_name, :last_name, :email
  validates :email, presence: true, format: Devise.email_regexp
end
