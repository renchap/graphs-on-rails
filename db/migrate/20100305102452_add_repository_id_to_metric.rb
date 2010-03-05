class AddRepositoryIdToMetric < ActiveRecord::Migration
  def self.up
    add_column :metrics, :repository_id, :integer
  end

  def self.down
    remove_column :metrics, :repository_id
  end
end
