class CreateLostItems < ActiveRecord::Migration[5.1]
  def change
    create_table :lost_items do |t|
      t.string :title
      t.text :description
      t.string :location
      t.date :found_date
      t.boolean :is_approved
      t.boolean :is_solved
      t.text :note
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
