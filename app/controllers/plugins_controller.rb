class PluginsController < ApplicationController
  before_filter :find_by_param, :except => [:index]
  
  rescue_from(ActiveRecord::RecordNotFound) { flash[:error] = 'Plugin not found' and redirect_to plugins_path}
  def index
    @plugins = Plugin::all(:order => 'name ASC')
  end

  def show
  end

  protected
    def find_by_param
      @plugin = Plugin.find(params['id'])
    end
end
