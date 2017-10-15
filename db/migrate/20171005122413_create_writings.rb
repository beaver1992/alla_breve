class CreateWritings < ActiveRecord::Migration[5.1]
  def change
    create_table :writings do |t|
      t.string :name
      t.text :annotation
      t.boolean :active, default: false, null: false
      t.date :published_date
      t.string :slug
      t.text :body
      t.string :type
      t.text :preview_data

      t.timestamps
    end
  end
end
