class Property < ApplicationRecord
  # Direct associations

  has_many   :maintenance_requests,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
