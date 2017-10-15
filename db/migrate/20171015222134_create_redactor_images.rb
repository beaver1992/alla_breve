class CreateRedactorImages < ActiveRecord::Migration[5.1]
  def change
    create_table :redactor_images do |t|
      t.string :image_data

      t.timestamps
    end
  end
end
