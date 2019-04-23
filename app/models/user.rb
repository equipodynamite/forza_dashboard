class User < ApplicationRecord
  rolify
  has_many :attendances
  has_many :objectives
  has_many :payments
  has_many :physical_tests
  has_and_belongs_to_many :roles, join_table: :users_roles
  belongs_to :membership, optional: true
  devise :database_authenticatable, :registerable, :rememberable, :validatable
  validates :email, :username, presence: true

  after_create :assign_default_role, :set_active_to_true

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

  def assign_default_role
    self.add_role :member if self.roles.blank?
  end

  def set_active_to_true
    self.active = true
  end
end
