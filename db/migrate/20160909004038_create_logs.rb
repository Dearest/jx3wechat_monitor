class CreateLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :logs do |t|
      t.string :title
      t.integer :status

      t.timestamps
    end
  end
end
