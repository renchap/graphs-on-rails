class MetricsController < ApplicationController
  respond_to :html, :json
  def show
    @metric = Metric.from_param(params[:id])
    @page_title = "#{@metric.host.name} / #{@metric.name}"
    respond_to do |format|
      format.html
      format.json do
        result = Hash.new
        result[:options] = Hash.new
        result[:options][:yaxis] = Hash.new
        result[:options][:yaxis][:min] = @metric.options[:minimum] if @metric.options[:minimum]
        result[:options][:yaxis][:tickFormatter] = @metric.options[:unit] if @metric.options[:unit]
        result[:series] = Array.new
        result[:series][0] = Hash.new
        result[:series][0][:label] = @metric.name
        result[:series][0][:data] = @metric.get_data(Time.now-1.hour, Time.now).map do |x|
          [x[0]*1000,x[1]]
        end
        
        render :json => result
      end
    end
  end
end
