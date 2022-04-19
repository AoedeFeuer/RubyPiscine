class InitComment < ActiveRecord::Migration
  def change
    create_table :comments, id: false do |t|
      t.integer :id
      t.text :content
      t.integer :cuicui_id
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :user_id
    end
  end
end
