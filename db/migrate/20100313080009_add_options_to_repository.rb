class AddOptionsToRepository < ActiveRecord::Migration
  def self.up
    add_column :repositories, :options, :text
    Repository.reset_column_information
    Repository.find(:all).each do |repository|
      repository.update_attribute(:options, { :path => repository.path })
      repository.save
    end
    remove_column :repositories, :path
  end

  def self.down
    add_column :repositories, :path, :string
    Repository.reset_column_information
    Repository.find(:all).each do |repository|
      repository.update_attribute(:path, repository.options[:path])
      repository.save
    end
    remove_column :repositories, :options
  end
end
