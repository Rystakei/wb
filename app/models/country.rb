class Country < ActiveRecord::Base
  attr_accessible :id, :name, :status, :region, :code
  belongs_to :user
end
