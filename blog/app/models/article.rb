class Article < ApplicationRecord
    # User class has_many articles, so we need to update the association in this Article class
    belongs_to :user
    
    # This Class is associated with Comments class in a "has_many" relationship
    # dependent option of an association used to delete all comments when deleting article
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :dislikes, dependent: :destroy
    
    # Adds the ability to display all comments asociated with an Article
    # using @article.comments
    validates :title, presence: true, length: {minimum: 5}
    validates :text, presence: true, length: {minimum: 10}
    
     def self.search(search)
     
    where (['title LIKE ?', "%#{search}%"])
    
     end
end
