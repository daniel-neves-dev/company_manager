class CreateEmployees < ActiveRecord::Migration[7.1]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :employee_id
      t.integer :department
      t.integer :role
      t.integer :status

      t.timestamps
    end
  end
end
