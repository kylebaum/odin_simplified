class Tenant < ApplicationRecord
  # Direct associations

  has_one    :property,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
