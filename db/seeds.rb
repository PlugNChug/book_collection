# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Book.create!([
    {title: "The Hobbit", author: "J.R.R. Tolkien", price: 9.99, publish_date: "1937-09-21"},
    {title: "The Lord of the Rings", author: "J.R.R. Tolkien", price: 19.99, publish_date: "1954-07-29"},
    {title: "Harry Potter and the Philosopher's Stone", author: "J.K. Rowling", price: 9.99, publish_date: "1997-06-26"},
    {title: "Harry Potter and the Chamber of Secrets", author: "J.K. Rowling", price: 9.99, publish_date: "1998-07-02"},
    {title: "The Hunger Games", author: "Suzanne Collins", price: 9.99, publish_date: "2008-09-17"},
    {title: "The Hunger Games: Catching Fire", author: "Suzanne Collins", price: 9.99, publish_date: "2013-09-16"},
    {title: "The Hunger Games: Mockingjay", author: "Suzanne Collins", price: 9.99, publish_date: "2014-11-18"},
    {title: "The Old Man and the Sea", author: "Ernest Hemingway", price: 9.99, publish_date: "1952-03-01"},
    {title: "The Great Gatsby", author: "F. Scott Fitzgerald", price: 9.99, publish_date: "1925-04-10"},
    {title: "Charlotte's Web", author: "E.B. White", price: 9.99, publish_date: "1952-01-01"}
])