json.extract! like, :id, :user_id, :book_id, :like_counts, :created_at, :updated_at
json.url like_url(like, format: :json)
