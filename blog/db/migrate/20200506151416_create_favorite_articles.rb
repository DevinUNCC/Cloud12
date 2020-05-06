class CreateFavoriteArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_articles do |t|
      t.integer :article_id
      t.string :user_id
      t.string :integer

      t.timestamps
    end
  end
end
