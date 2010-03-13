class UpdateMetricPaths < ActiveRecord::Migration
  def self.up 
    say_with_time "Updating metric paths..." do
      Repository.find_all_by_type('collectd').each do |r|
        r.metrics.each do |metric|
          metric.options[:path] = File.expand_path(metric.options[:path]).gsub(File.expand_path(metric.repository.options[:path])+'/', '')
          metric.unique_id = metric.options[:path]+'#'+metric.options[:rra]
          metric.save
        end
      end
    end
  end

  def self.down
    say_with_time "Updating metric paths..." do
      Repository.find_all_by_type('collectd').each do |r|
        r.metrics.each do |metric|
          metric.options[:path] = File.expand_path(r.options[:path]+'/'+metric.options[:path])
          metric.unique_id = metric.options[:path]+'#'+metric.options[:rra]
          metric.save
        end
      end
    end
  end
end
