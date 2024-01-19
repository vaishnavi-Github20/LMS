json.extract! book, :id, :isbn, :title, :author, :language, :published, :edition, :associated_library, :cover_page, :summary, :special_collection, :created_at, :updated_at
json.url book_url(book, format: :json)
