class RepositoriesController < ApplicationController
  def index
    @repositories = Repository.find(:all, :order => "name ASC")
    @page_title = "Repositories"
  end
  
  def show
    @repository = Repository.from_param(params[:id])
  end
end
