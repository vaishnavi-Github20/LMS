json.extract! uni_library, :id, :name, :university, :location, :no_of_books, :overdue_fine, :created_at, :updated_at
json.url uni_library_url(uni_library, format: :json)
