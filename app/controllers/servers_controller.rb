class ServersController < ApplicationController
  before_filter :find_by_param, :except => [:index]

  rescue_from(ActiveRecord::RecordNotFound) { flash[:error] = 'Server not found' and redirect_to servers_path}

  def index
    @servers = Server.all(:order => 'hostname ASC')
  end

  def show
    
  end

  protected
    def find_by_param
      @server = Server.find(params['id'])
    end
end
