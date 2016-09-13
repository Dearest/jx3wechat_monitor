class CreatePushLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :push_logs do |t|
      t.string :title
      t.text :url
      t.datetime :time

      t.timestamps
    end
  end
end
