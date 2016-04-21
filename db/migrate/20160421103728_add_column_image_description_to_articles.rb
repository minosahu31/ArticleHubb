class AddColumnImageDescriptionToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :image_description, :string
  end
end
