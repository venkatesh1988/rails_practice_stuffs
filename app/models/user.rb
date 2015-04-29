class User < ActiveRecord::Base
	validates_presence_of :name,:email
	has_many :address
	accepts_nested_attributes_for :address,reject_if: :all_blank,allow_destroy: :true
end
