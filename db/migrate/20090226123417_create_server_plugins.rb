class CreateServerPlugins < ActiveRecord::Migration
  def self.up
    create_table :server_plugins do |t|
      t.integer :server_id
      t.integer :plugin_id

      t.timestamps
    end
  end

  def self.down
    drop_table :server_plugins
  end
end
