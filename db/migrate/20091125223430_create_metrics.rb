class CreateMetrics < ActiveRecord::Migration
  def self.up
    create_table :metrics do |t|
      t.integer :rrd_file_id
      t.string :name
      t.string :type

      t.timestamps
    end
  end

  def self.down
    drop_table :metrics
  end
end
