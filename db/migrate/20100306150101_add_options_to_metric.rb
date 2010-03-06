class AddOptionsToMetric < ActiveRecord::Migration
  def self.up
    add_column :metrics, :options, :text
  end

  def self.down
    remove_column :metrics, :options
  end
end
