class CreateExamples < ActiveRecord::Migration[5.2]
  def change
    create_table :examples do |t|
      t.integer :category_id, null: false
      t.string :title, null: false
      t.string :body, null: false
      t.string :before_image_id, null: false
      t.string :after_image_id, null: false
      t.timestamps
    end
  end
end
