class AddRegiontoCountries < ActiveRecord::Migration
  def change
    add_column :countries, :region, :string
  end
end