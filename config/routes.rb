Rails.application.routes.draw do
  # Routes for the Tenant resource:
  # CREATE
  get "/tenants/new", :controller => "tenants", :action => "new"
  post "/create_tenant", :controller => "tenants", :action => "create"

  # READ
  get "/tenants", :controller => "tenants", :action => "index"
  get "/tenants/:id", :controller => "tenants", :action => "show"

  # UPDATE
  get "/tenants/:id/edit", :controller => "tenants", :action => "edit"
  post "/update_tenant/:id", :controller => "tenants", :action => "update"

  # DELETE
  get "/delete_tenant/:id", :controller => "tenants", :action => "destroy"
  #------------------------------

  # Routes for the Manager resource:
  # CREATE
  get "/managers/new", :controller => "managers", :action => "new"
  post "/create_manager", :controller => "managers", :action => "create"

  # READ
  get "/managers", :controller => "managers", :action => "index"
  get "/managers/:id", :controller => "managers", :action => "show"

  # UPDATE
  get "/managers/:id/edit", :controller => "managers", :action => "edit"
  post "/update_manager/:id", :controller => "managers", :action => "update"

  # DELETE
  get "/delete_manager/:id", :controller => "managers", :action => "destroy"
  #------------------------------

  # Routes for the Property resource:
  # CREATE
  get "/properties/new", :controller => "properties", :action => "new"
  post "/create_property", :controller => "properties", :action => "create"

  # READ
  get "/properties", :controller => "properties", :action => "index"
  get "/properties/:id", :controller => "properties", :action => "show"

  # UPDATE
  get "/properties/:id/edit", :controller => "properties", :action => "edit"
  post "/update_property/:id", :controller => "properties", :action => "update"

  # DELETE
  get "/delete_property/:id", :controller => "properties", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
