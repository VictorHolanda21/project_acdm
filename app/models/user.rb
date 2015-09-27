class User < ActiveRecord::Base

  belongs_to :administrator
  belongs_to :student
  belongs_to :teacher

  enum role: [:administrator, :student, :teacher]


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
