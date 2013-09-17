class AddCodetoCountries < ActiveRecord::Migration
  def change
    add_column :countries, :code, :string
  end
end
