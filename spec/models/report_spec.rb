# frozen_string_literal: true

require 'rails_helper'

describe Report, type: :model do
    describe 'associations' do
        it { should belong_to(:user) }
        it { should belong_to(:project) }
    end

    describe 'validations' do
        it { should validate_presence_of(:title) }
    end
  end