class MaintenanceRequestsController < ApplicationController
  def index
    @maintenance_requests = MaintenanceRequest.all

    render("maintenance_requests/index.html.erb")
  end

  def show
    @maintenance_request = MaintenanceRequest.find(params[:id])

    render("maintenance_requests/show.html.erb")
  end

  def new
    @maintenance_request = MaintenanceRequest.new

    render("maintenance_requests/new.html.erb")
  end

  def create
    @maintenance_request = MaintenanceRequest.new

    @maintenance_request.property_id = params[:property_id]
    @maintenance_request.body_of_request = params[:body_of_request]

    save_status = @maintenance_request.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/maintenance_requests/new", "/create_maintenance_request"
        redirect_to("/maintenance_requests")
      else
        redirect_back(:fallback_location => "/", :notice => "Maintenance request created successfully.")
      end
    else
      render("maintenance_requests/new.html.erb")
    end
  end

  def edit
    @maintenance_request = MaintenanceRequest.find(params[:id])

    render("maintenance_requests/edit.html.erb")
  end

  def update
    @maintenance_request = MaintenanceRequest.find(params[:id])

    @maintenance_request.property_id = params[:property_id]
    @maintenance_request.body_of_request = params[:body_of_request]

    save_status = @maintenance_request.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/maintenance_requests/#{@maintenance_request.id}/edit", "/update_maintenance_request"
        redirect_to("/maintenance_requests/#{@maintenance_request.id}", :notice => "Maintenance request updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Maintenance request updated successfully.")
      end
    else
      render("maintenance_requests/edit.html.erb")
    end
  end

  def destroy
    @maintenance_request = MaintenanceRequest.find(params[:id])

    @maintenance_request.destroy

    if URI(request.referer).path == "/maintenance_requests/#{@maintenance_request.id}"
      redirect_to("/", :notice => "Maintenance request deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Maintenance request deleted.")
    end
  end
end
