class CreateCharities < ActiveRecord::Migration[5.1]
  def change
    create_table :charities do |t|
      t.string :name
      t.string :description
      t.string :url
      t.string :contact
      t.string :phone
      t.boolean :verified, default: false

      t.timestamps
    end
  end
end
