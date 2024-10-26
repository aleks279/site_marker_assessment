class Project < ApplicationRecord
  belongs_to :user

  has_many :documents, dependent: :destroy
  has_many :reports, dependent: :destroy
  
  validates :name, presence: true
  validates :description, presence: true
end
