ActiveAdmin.register Property do

 permit_params :owner_id, :tenant_id, :manager_id, :home_or_apartment, :number_bedrooms, :number_bathrooms, :city, :neighborhood, :policies, :price

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
