class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :created_projects, class_name: 'Project', inverse_of: :user
  has_many :created_reports, class_name: 'Report', inverse_of: :user
  has_many :created_documents, class_name: 'Document', inverse_of: :user

  has_many :user_roles
  has_many :roles, through: :user_roles
  
  def has_full_access?
    roles.map(&:name).include?(Role::VALID_ROLES[:full_access])
  end

  def can_edit?
    roles.map(&:name).include?(Role::VALID_ROLES[:edit])
  end

  def can_view?
    roles.map(&:name).include?(Role::VALID_ROLES[:view])
  end
end
