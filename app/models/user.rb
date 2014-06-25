class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :organized_lunches, class_name: 'Lunch', foreign_key: 'organizer_id'
  has_and_belongs_to_many :attended_lunches, class_name: 'Lunch'
end
