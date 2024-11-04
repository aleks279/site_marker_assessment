class CreateUserRoles < ActiveRecord::Migration[7.1]
  def up
    create_table :roles do |t|
      t.string :name

      t.timestamps
    end

    create_table :user_roles do |t|
      t.belongs_to :user
      t.belongs_to :role

      t.timestamps
    end

    Role::VALID_ROLES.values.each do |role|
      Role.create!(name: role)
    end
  end

  def down
    UserRole.destroy_all
    Role.destroy_all

    drop_table :roles
    drop_table :user_roles
  end
end
