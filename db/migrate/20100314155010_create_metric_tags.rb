class CreateMetricTags < ActiveRecord::Migration
  def self.up
    create_table :metric_tags do |t|
      t.integer :metric_id
      t.integer :tag_id

      t.timestamps
    end
  end

  def self.down
    drop_table :metric_tags
  end
end
