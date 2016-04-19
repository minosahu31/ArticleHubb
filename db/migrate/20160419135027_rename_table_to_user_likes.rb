class RenameTableToUserLikes < ActiveRecord::Migration
  def change
  	rename_table :like, :likes
  end
end
