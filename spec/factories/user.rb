
FactoryBot.define do
    factory(:user) do
      email { Faker::Internet.email }
      password { Faker::Internet.password }

      trait(:full_access) do
        after(:create) do |user|
          role = create(:role, :full_access)
          user.roles << role
          user.save!
        end
      end
    end
  end