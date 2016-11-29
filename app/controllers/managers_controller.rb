class ManagersController < ApplicationController
  def index
    @managers = Manager.all

    render("managers/index.html.erb")
  end

  def show
    @property = Property.new
    @manager = Manager.find(params[:id])

    render("managers/show.html.erb")
  end

  def new
    @manager = Manager.new

    render("managers/new.html.erb")
  end

  def create
    @manager = Manager.new

    @manager.email = params[:email]
    @manager.password = params[:password]

    save_status = @manager.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/managers/new", "/create_manager"
        redirect_to("/managers")
      else
        redirect_back(:fallback_location => "/", :notice => "Manager created successfully.")
      end
    else
      render("managers/new.html.erb")
    end
  end

  def edit
    @manager = Manager.find(params[:id])

    render("managers/edit.html.erb")
  end

  def update
    @manager = Manager.find(params[:id])

    @manager.email = params[:email]
    @manager.password = params[:password]

    save_status = @manager.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/managers/#{@manager.id}/edit", "/update_manager"
        redirect_to("/managers/#{@manager.id}", :notice => "Manager updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Manager updated successfully.")
      end
    else
      render("managers/edit.html.erb")
    end
  end

  def destroy
    @manager = Manager.find(params[:id])

    @manager.destroy

    if URI(request.referer).path == "/managers/#{@manager.id}"
      redirect_to("/", :notice => "Manager deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Manager deleted.")
    end
  end
end
