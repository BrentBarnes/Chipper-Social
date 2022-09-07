class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :author
      t.text :post_content

      t.timestamps
    end
  end
end
