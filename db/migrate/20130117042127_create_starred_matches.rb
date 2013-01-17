class CreateStarredMatches < ActiveRecord::Migration
  def change
    create_table :starred_matches do |t|
      t.integer :user_id
      t.integer :matchee_id
      t.string :type

      t.timestamps
    end
  end
end
