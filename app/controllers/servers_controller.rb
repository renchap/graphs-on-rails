class ServersController < ApplicationController
  before_filter :find_by_param, :except => [:index]
  def index
    @servers = Server.all(:order => 'hostname ASC')
  end

  def show
    
  end

  protected
    def find_by_param
      begin
        @server = Server.find(params['id'])
      rescue(ActiveRecord::RecordNotFound)
        redirect_to servers_path
        false
      end
    end
end
