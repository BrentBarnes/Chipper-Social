class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :location, :string
    add_column :users, :education, :string
    add_column :users, :occupation, :string
    add_column :users, :birthday, :date
  end
end
