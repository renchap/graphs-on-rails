class CreateRrdFiles < ActiveRecord::Migration
  def self.up
    create_table :rrd_files do |t|
      t.integer :host_id
      t.string :path

      t.timestamps
    end
  end

  def self.down
    drop_table :rrd_files
  end
end
