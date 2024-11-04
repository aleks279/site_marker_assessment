class Role < ApplicationRecord
  VALID_ROLES = {
    full_access: 'full access',
    edit: 'edit',
    view: 'view'
  }
  public_constant :VALID_ROLES

  validates :name, presence: true, inclusion: { in: VALID_ROLES.values }

  has_many :user_roles
  has_many :users, through: :user_roles
end
