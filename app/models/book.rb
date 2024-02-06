class Book < ApplicationRecord
    # belongs_to :author
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :rates, dependent: :destroy

    validates :title, presence: true
    validates :author_name, presence: true
    validates :subject, presence: true
    validates :image_url, presence: true

end
