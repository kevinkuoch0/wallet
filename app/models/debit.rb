class Debit < ActiveRecord::Base

  validates_presence_of :card_num, :exp_month, :exp_year 

  validates_numericality_of :exp_month, only_integer: true

  validates :exp_month, inclusion: {in: 1..12}

  validates_numericality_of :exp_year, greater_than_or_equal_to: 2015

  validates :card_num, length: {in: 15..16}

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  belongs_to :user
end
