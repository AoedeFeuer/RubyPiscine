class InitLike < ActiveRecord::Migration
  def change
    create_table :likes, id: false do |t|
      t.integer :id
      t.integer :user_id
      t.integer :cuicui_id
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
