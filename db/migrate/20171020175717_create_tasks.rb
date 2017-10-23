class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.string :address
      t.string :category
      t.date :date
      t.integer :max_people
      t.float :lat
      t.float :lng
      t.integer :charity_id

      t.timestamps
    end
  end
end
