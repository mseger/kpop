class AddRoommateSurveyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :company, :string
    add_column :users, :cleanliness, :integer
    add_column :users, :house_parties, :boolean
    add_column :users, :loudness, :boolean
    add_column :users, :about, :text
  end
end
