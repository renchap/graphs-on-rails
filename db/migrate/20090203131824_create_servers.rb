class CreateServers < ActiveRecord::Migration
  def self.up
    create_table :servers do |t|
      t.string :hostname
      t.integer :munin_server_id

      t.timestamps
    end
  end

  def self.down
    drop_table :servers
  end
end
