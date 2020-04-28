class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.integer :end_user_id, null: false
      t.integer :category_id, null: false
      t.integer :home_builder_id
      t.string :title, null: false
      t.string :body, null: false
      t.string :housing_type, null: false
      t.string :preferred_contact, null: false
      t.string :admin_memo
      t.integer :react_status, null: false, default: 0

      t.timestamps
    end
  end
end
