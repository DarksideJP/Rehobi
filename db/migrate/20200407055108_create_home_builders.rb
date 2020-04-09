class CreateHomeBuilders < ActiveRecord::Migration[5.2]
  def change
    create_table :home_builders do |t|
      t.string :name, null: false
      t.integer :aria, null: false

      t.timestamps
    end
  end
end
