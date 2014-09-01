class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title, null: false
      t.text :body, null: false

      t.belongs_to :user

      t.timestamps
    end
  end
end
