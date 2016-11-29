class PropertiesController < ApplicationController
  def index
    @properties = Property.all

    render("properties/index.html.erb")
  end

  def show
    @property = Property.find(params[:id])

    render("properties/show.html.erb")
  end

  def new
    @property = Property.new

    render("properties/new.html.erb")
  end

  def create
    @property = Property.new

    @property.owner_id = params[:owner_id]
    @property.tenant_id = params[:tenant_id]
    @property.manager_id = params[:manager_id]
    @property.home_or_apartment = params[:home_or_apartment]
    @property.number_bedrooms = params[:number_bedrooms]
    @property.number_bathrooms = params[:number_bathrooms]
    @property.city = params[:city]
    @property.neighborhood = params[:neighborhood]
    @property.policies = params[:policies]
    @property.price = params[:price]

    save_status = @property.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/properties/new", "/create_property"
        redirect_to("/properties")
      else
        redirect_back(:fallback_location => "/", :notice => "Property created successfully.")
      end
    else
      render("properties/new.html.erb")
    end
  end

  def edit
    @property = Property.find(params[:id])

    render("properties/edit.html.erb")
  end

  def update
    @property = Property.find(params[:id])

    @property.owner_id = params[:owner_id]
    @property.tenant_id = params[:tenant_id]
    @property.manager_id = params[:manager_id]
    @property.home_or_apartment = params[:home_or_apartment]
    @property.number_bedrooms = params[:number_bedrooms]
    @property.number_bathrooms = params[:number_bathrooms]
    @property.city = params[:city]
    @property.neighborhood = params[:neighborhood]
    @property.policies = params[:policies]
    @property.price = params[:price]

    save_status = @property.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/properties/#{@property.id}/edit", "/update_property"
        redirect_to("/properties/#{@property.id}", :notice => "Property updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Property updated successfully.")
      end
    else
      render("properties/edit.html.erb")
    end
  end

  def destroy
    @property = Property.find(params[:id])

    @property.destroy

    if URI(request.referer).path == "/properties/#{@property.id}"
      redirect_to("/", :notice => "Property deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Property deleted.")
    end
  end
end
