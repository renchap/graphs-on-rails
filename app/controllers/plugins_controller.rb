class PluginsController < ApplicationController
  def index
    @plugins = Plugin::all(:order => 'name ASC')
  end

  def show
  end

end
