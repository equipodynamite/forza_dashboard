class User < ApplicationRecord
  has_many :attendances
  has_many :objectives
  has_many :payments
  has_many :physical_tests
  belongs_to :membership
  has_and_belongs_to_many :roles, join_table: :users_roles
  # Include default devise modules. Others available are:
  # :recoverable, :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :validatable
  validates :email, :username, presence: true

  before_validation :assign_membership, on: :create

  attr_accessor :login

  enum program: {
      UBP: 1,
      MU: 2,
      INT: 3,
      AVZ: 4,
      PRS: 5
  }

  private

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    where(conditions.to_h).
    where(['lower(username) = :value or lower(email) = :value', { value: login.downcase }]).
    first
  end

  def assign_membership
    new_membership = Membership.create(start_date: DateTime.now, duration: 1)
    self.membership_id = new_membership.id
  end
end
