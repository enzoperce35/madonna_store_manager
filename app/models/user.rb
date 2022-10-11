class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :username, uniqueness: true

  has_one :branch_user, dependent: :destroy
  has_one :branch, through: :branch_user

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def email_required?
    false
  end

  def will_save_change_to_email?
    false
  end
end