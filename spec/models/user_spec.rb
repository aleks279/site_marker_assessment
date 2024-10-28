# frozen_string_literal: true

require 'rails_helper'

describe User, type: :model do
    describe 'associations' do
        it { should have_many(:created_projects).class_name('Project').inverse_of(:user) }
        it { should have_many(:created_reports).class_name('Report').inverse_of(:user) }
        it { should have_many(:created_documents).class_name('Document').inverse_of(:user) }
    end
  end