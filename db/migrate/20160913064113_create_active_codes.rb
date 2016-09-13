class CreateActiveCodes < ActiveRecord::Migration[5.0]
  def change
    create_table :active_codes do |t|
      t.integer :push_logs_id
      t.string :title
      t.string :code

      t.timestamps
    end
  end
end
