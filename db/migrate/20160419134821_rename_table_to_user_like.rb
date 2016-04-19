class RenameTableToUserLike < ActiveRecord::Migration
  def change
  	rename_table :user_likes, :like
  end
end
