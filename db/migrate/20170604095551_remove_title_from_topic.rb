class RemoveTitleFromTopic < ActiveRecord::Migration
  def change
    remove_column :topics, :title, :string
  end
end
