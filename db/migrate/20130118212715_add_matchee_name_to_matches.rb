class AddMatcheeNameToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :matchee_name, :string
  end
end
