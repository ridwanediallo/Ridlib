class Book < ApplicationRecord
    # belongs_to :author
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :rates, dependent: :destroy
end
