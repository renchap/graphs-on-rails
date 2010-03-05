class CreateTags < ActiveRecord::Migration
  def self.up
    create_table :tags do |t|
      t.integer :parent_id
      t.string :name

      t.timestamps
      
    end
    add_index :tags, [:name, :parent_id], :unique => true, :name => 'name_parent_id_index'
  end

  def self.down
    remove_index :tags, :column => [:name, :parent_id]
    drop_table :tags
  end
end