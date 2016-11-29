class Property < ApplicationRecord
  # Direct associations

  belongs_to :tenant

  belongs_to :manager

  has_many   :messages,
             :dependent => :destroy

  has_many   :maintenance_requests,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
