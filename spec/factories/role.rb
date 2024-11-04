FactoryBot.define do
  factory(:role) do
    name { Role::VALID_ROLES.values.sample }

    trait(:full_access) do
      name { Role::VALID_ROLES[:full_access] }
    end
  
    trait(:edit) do
      name { Role::VALID_ROLES[:edit] }
    end
  
    trait(:view) do
      name { Role::VALID_ROLES[:view] }
    end
  end
end