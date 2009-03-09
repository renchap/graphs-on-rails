class ServersController < ApplicationController
  def index
    @servers = Server.all(:order => 'hostname ASC')
  end

  def show
  end

end
