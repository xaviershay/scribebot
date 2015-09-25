class Initial < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :username, null: false
      t.text :message, null: false
      t.datetime :created_at, null: false
    end
  end
end
