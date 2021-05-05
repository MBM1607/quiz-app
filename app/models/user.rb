class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_many :quizzes

  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize: '100x100'
  end

end
