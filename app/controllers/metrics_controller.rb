class MetricsController < ApplicationController
  respond_to :html, :json
  def show
    @metric = Metric.from_param(params[:id])
    respond_to do |format|
      format.html
      format.json do
        result = Hash.new
        result[:label] = @metric.name
        result[:data] = @metric.get_data(Time.now-5.minutes, Time.now).map do |x|
          [x[0]*1000,x[1]]
        end
        
        render :json => result
      end
    end
  end
end
