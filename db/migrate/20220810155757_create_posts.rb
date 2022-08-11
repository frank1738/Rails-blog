# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :text
      t.integer :comments_counter
      t.integer :likes_counter
      t.references :author, index: true, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end



fourth_user = User.create(name: 'clinton', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'teacher')

first_post = Post.create(author: fourth_user, title: 'Hello', text: 'This is my first post')