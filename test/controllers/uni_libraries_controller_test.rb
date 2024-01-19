require "test_helper"

class UniLibrariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @uni_library = uni_libraries(:one)
  end

  test "should get index" do
    get uni_libraries_url
    assert_response :success
  end

  test "should get new" do
    get new_uni_library_url
    assert_response :success
  end

  test "should create uni_library" do
    assert_difference("UniLibrary.count") do
      post uni_libraries_url, params: { uni_library: { location: @uni_library.location, name: @uni_library.name, no_of_books: @uni_library.no_of_books, overdue_fine: @uni_library.overdue_fine, university: @uni_library.university } }
    end

    assert_redirected_to uni_library_url(UniLibrary.last)
  end

  test "should show uni_library" do
    get uni_library_url(@uni_library)
    assert_response :success
  end

  test "should get edit" do
    get edit_uni_library_url(@uni_library)
    assert_response :success
  end

  test "should update uni_library" do
    patch uni_library_url(@uni_library), params: { uni_library: { location: @uni_library.location, name: @uni_library.name, no_of_books: @uni_library.no_of_books, overdue_fine: @uni_library.overdue_fine, university: @uni_library.university } }
    assert_redirected_to uni_library_url(@uni_library)
  end

  test "should destroy uni_library" do
    assert_difference("UniLibrary.count", -1) do
      delete uni_library_url(@uni_library)
    end

    assert_redirected_to uni_libraries_url
  end
end
