class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.integer :user_id
      t.string :title
      t.attachment :header_image
      t.text :description

      t.timestamps
    end
  end
end
