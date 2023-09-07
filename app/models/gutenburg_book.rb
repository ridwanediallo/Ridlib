class GutenburgBook

 def self.fetch_book(gutenburg_book_id)
    connection = Faraday.new(url: 'https://gutendex.com')
    response = connection.get("/books/#{gutenburg_book_id}/")

    if response.body.present?
      JSON.parse(response.body)
    else
      puts "Empty response body received."
    end
  end
end
