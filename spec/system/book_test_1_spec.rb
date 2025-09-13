require "rails_helper"

RSpec.describe "Books", type: :system do
  before { driven_by(:rack_test) }

  def create_book(title:, author:, price:, publish_date:)
    visit new_book_path
    fill_in "Title", with: title
    fill_in "Author", with: author
    fill_in "Price", with: price
    fill_in "Publish date", with: publish_date # assumes a date field or text field; see note below
    expect {
      click_button "Create Book"
    }.to change(Book, :count).by(1)
  end

  it "adds a book and shows the success flash notice" do
    visit new_book_path

    create_book(
      title: "Hello",
      author: "World",
      price: "3.99",
      publish_date: "2025-09-08"
    )

    expect(page).to have_current_path(books_path)
    expect(page).to have_text("Book was successfully created.")

    last = Book.order(:id).last
    expect(last.title).to eq("Hello")
    expect(last.author).to eq("World")
    expect(last.price).to eq(3.99)
    expect(last.publish_date).to eq(Date.new(2025,9,8))
  end

  it "fails to add a book with blank author and shows the alert flash" do
    visit new_book_path
    fill_in "Title", with: "My Favorite Garlic Powder Recipe"
    fill_in "Author", with: ""
    fill_in "Price", with: "2.00"
    fill_in "Publish date", with: "2000-01-01"
    expect {
      click_button "Create Book"
    }.not_to change(Book, :count)

    expect(page).to have_text("Book could not be created.")
    expect(page).to have_text("prohibited this book from being saved")
    expect(page).to have_text("Author can't be blank")
  end

  it "fails to add a book with invalid price and shows the alert flash" do
    visit new_book_path
    fill_in "Title", with: "Impossible Prices!"
    fill_in "Author", with: "Me!"
    fill_in "Price", with: "-99"
    fill_in "Publish date", with: "2000-01-01"
    expect {
      click_button "Create Book"
    }.not_to change(Book, :count)

    expect(page).to have_text("Book could not be created.")
    expect(page).to have_text("prohibited this book from being saved")
    expect(page).to have_text("Price must be greater than or equal to 0")
  end

  it "fails to add a book with no publish date and shows the alert flash" do
    visit new_book_path
    fill_in "Title", with: "Unknown Date"
    fill_in "Author", with: "You"
    fill_in "Price", with: "54.99"
    fill_in "Publish date", with: ""
    expect {
      click_button "Create Book"
    }.not_to change(Book, :count)

    expect(page).to have_text("Book could not be created.")
    expect(page).to have_text("prohibited this book from being saved")
    expect(page).to have_text("Publish date can't be blank")
  end
end
