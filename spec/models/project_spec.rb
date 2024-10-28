# frozen_string_literal: true

require 'rails_helper'

describe Project, type: :model do
    describe 'associations' do
        it { should belong_to(:user) }
        it { should have_many(:reports) }
        it { should have_many(:documents) }
    end

    describe 'validations' do
        it { should validate_presence_of(:name) }
        it { should validate_presence_of(:description) }
    end
  end