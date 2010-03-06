class AddUniqueIdToMetric < ActiveRecord::Migration
  def self.up
    add_column :metrics, :unique_id, :string
  end

  def self.down
    remove_column :metrics, :unique_id
  end
end
