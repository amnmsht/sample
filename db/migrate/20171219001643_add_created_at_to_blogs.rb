class AddCreatedAtToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :created_at, :datetime
  end
end
