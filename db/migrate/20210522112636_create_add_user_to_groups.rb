class CreateAddUserToGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :add_user_to_groups do |t|
      t.integer :user_id
      t.integer :room_id

      t.timestamps
    end
  end
end
