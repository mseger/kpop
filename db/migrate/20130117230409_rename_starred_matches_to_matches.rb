class RenameStarredMatchesToMatches < ActiveRecord::Migration
  def up
    rename_table :starred_matches, :matches 
    add_column :matches, :starred, :boolean
  end

  def down
    remove_column :matches, :starred 
    rename_table :matches, :starred_matches
  end
end
