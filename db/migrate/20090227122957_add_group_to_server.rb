class AddGroupToServer < ActiveRecord::Migration
  def self.up
    add_column :servers, :group, :string
  end

  def self.down
    remove_column :servers, :group
  end
end
