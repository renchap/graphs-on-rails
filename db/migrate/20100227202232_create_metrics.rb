class CreateMetrics < ActiveRecord::Migration
  def self.up
    create_table :metrics do |t|
      t.string :name
      t.integer :host_id

      t.timestamps
    end
  end

  def self.down
    drop_table :metrics
  end
end
