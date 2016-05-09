class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :memberships
  has_many :groups, through: :memberships
  has_many :goals 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :card_number, length: { is: 16 }
  validates :login_pin, length: { is: 4 }
  validates :nick_name, presence: true
end
