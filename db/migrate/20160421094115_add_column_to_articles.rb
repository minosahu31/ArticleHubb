class AddColumnToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :post_image, :string
  end
end
