
FactoryBot.define do
    factory(:document) do
      name { Faker::File.file_name }
      user
      project
    end
  end