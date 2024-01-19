require "application_system_test_case"

class UniLibrariesTest < ApplicationSystemTestCase
  setup do
    @uni_library = uni_libraries(:one)
  end

  test "visiting the index" do
    visit uni_libraries_url
    assert_selector "h1", text: "Uni libraries"
  end

  test "should create uni library" do
    visit uni_libraries_url
    click_on "New uni library"

    fill_in "Location", with: @uni_library.location
    fill_in "Name", with: @uni_library.name
    fill_in "No of books", with: @uni_library.no_of_books
    fill_in "Overdue fine", with: @uni_library.overdue_fine
    fill_in "University", with: @uni_library.university
    click_on "Create Uni library"

    assert_text "Uni library was successfully created"
    click_on "Back"
  end

  test "should update Uni library" do
    visit uni_library_url(@uni_library)
    click_on "Edit this uni library", match: :first

    fill_in "Location", with: @uni_library.location
    fill_in "Name", with: @uni_library.name
    fill_in "No of books", with: @uni_library.no_of_books
    fill_in "Overdue fine", with: @uni_library.overdue_fine
    fill_in "University", with: @uni_library.university
    click_on "Update Uni library"

    assert_text "Uni library was successfully updated"
    click_on "Back"
  end

  test "should destroy Uni library" do
    visit uni_library_url(@uni_library)
    click_on "Destroy this uni library", match: :first

    assert_text "Uni library was successfully destroyed"
  end
end
