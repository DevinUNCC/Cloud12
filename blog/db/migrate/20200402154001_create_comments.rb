#This class was generated with the "rails generate model Comment..." command
class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :article, foreign_key: true 
      # "...article:references" option in the aforemention command creates
      # an integer column called article_id, an index for it, and a foreign
      # key constraint pointing to the id column of the articles table.
      t.timestamps
    end
  end
end
