class AddColumnToComments < ActiveRecord::Migration
  def change
    add_column :comments, :article_id, :string
    add_column :comments, :user_id, :string
  end
end
