json.extract! book, :id, :title, :author_id, :description, :publication_date, :image_url, :created_at, :updated_at
json.url book_url(book, format: :json)
