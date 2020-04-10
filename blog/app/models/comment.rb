class Comment < ApplicationRecord
  belongs_to :article   # This class is associated with the Article class. (i.e "Comment belongs_to :article")
end
