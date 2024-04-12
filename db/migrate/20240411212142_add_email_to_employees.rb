class AddEmailToEmployees < ActiveRecord::Migration[7.1]
  def change
    add_column :employees, :email, :string
    add_index :employees, :email, unique: true
  end
end
