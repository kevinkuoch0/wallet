class User < ActiveRecord::Base
 
validates_presence_of :email, :password, :fname, :lname

 validates :email, uniqueness: true

 validates :password, length: { minimum: 4 },
confirmation: true

 validates :phone, format: { with: /\d{3}-\d{3}-\d{4}/, message:" format must be xxx-xxx-xxxx"}

 devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 has_many :debit
end
