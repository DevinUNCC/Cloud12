class Article < ApplicationRecord
    # This Class is associated with Comments class in a "has_many" relationship
    has_many :comments
    # Adds the ability to display all comments asociated with an Article
    # using @article.comments
    validates :title, presence: true, length: {minimum: 5}
    validates :text, presence: true, length: {minimum: 10}
end
