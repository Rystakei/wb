class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.string :id
      t.integer :status

      t.timestamps
    end
  end
end
