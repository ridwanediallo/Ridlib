class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :comment, presence: true, length: { minimum: 5,  maximum:250 }

end
