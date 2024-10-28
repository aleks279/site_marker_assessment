
FactoryBot.define do
    factory(:report) do
      title { Faker::Book.title }
      user
      project
    end
  end