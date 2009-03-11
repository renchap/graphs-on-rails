class MuninServersController < ApplicationController
  before_filter :find_by_param, :except => [:new, :create, :index]
  
  def show
  end

  def edit
  end
  
  def update
    if @munin_server.update_attributes(params[:munin_server])
      flash[:notice] = 'Munin server successfully updated'
      redirect_to munin_server_path(@munin_server)
    else
      render :action => 'edit'
    end
  end

  def new
    @munin_server = MuninServer.new
  end
  
  def create
    @munin_server = MuninServer.new(params[:munin_server])
    if @munin_server.save
      flash[:notice] = 'Munin server was successfully created'
      redirect_to munin_server_path(@munin_server)
    else
      render :action => 'new'
    end
  end

  def index
    @munin_servers = MuninServer.all
  end
  
  protected
    def find_by_param
      begin
        @munin_server = MuninServer.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        flash[:error] = 'Munin server not found'
        redirect_to munin_servers_path
	      false
      end
    end

end
