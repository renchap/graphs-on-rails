class CreateMuninServers < ActiveRecord::Migration
  def self.up
    create_table :munin_servers do |t|
      t.string :url
      t.string :http_user
      t.string :http_password
      t.datetime :last_fetched

      t.timestamps
    end
  end

  def self.down
    drop_table :munin_servers
  end
end
