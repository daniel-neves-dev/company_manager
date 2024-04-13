class CreateStatics < ActiveRecord::Migration[7.1]
  def change
    create_table :statics do |t|
      t.string :index

      t.timestamps
    end
  end
end
