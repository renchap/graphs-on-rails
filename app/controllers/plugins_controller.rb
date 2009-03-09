class PluginsController < ApplicationController
  before_filter :find_by_param, :except => [:index]
  def index
    @plugins = Plugin::all(:order => 'name ASC')
  end

  def show
  end

  protected
    def find_by_param
      begin
        @plugin = Plugin.find(params['id'])
      rescue ActiveRecord::RecordNotFound
        flash[:error] = 'Plugin not found'
        redirect_to plugins_path
	false
      end
    end
end
