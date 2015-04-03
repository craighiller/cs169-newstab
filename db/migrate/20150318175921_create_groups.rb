class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :user_id
      t.string :group_name
      t.boolean :private
      t.boolean :subscribers_only

      t.timestamps
    end
  end
end
