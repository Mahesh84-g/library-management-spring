package com.mahesh.model;

public class BooksModel {
	private int  bookId;
	private String bookTitle;
	private String bookAuthor;
	private String category;
	private int availableCopies;
	private int  borrowed_copies;
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public int getBookId() {
		return bookId;
	}
	public void setBorrowed_copies(int borrowed_copies) {
		this.borrowed_copies = borrowed_copies;
	}
	public int getBorrowed_copies() {
		return borrowed_copies;
	}
	public String getBookTitle() {
		return bookTitle;
	}
	public String getBookAuthor() {
		return bookAuthor;
	}
	public String getCategory() {
		return category;
	}
	public int getAvailableCopies() {
		return availableCopies;
	}
	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}
	public void setBookAuthor(String bookAuthor) {
		this.bookAuthor = bookAuthor;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public void setAvailableCopies(int availableCopies) {
		this.availableCopies = availableCopies;
	}
	public BooksModel() {
	
	}
	public String toString() {
		return "BoooksModel [bookId=" + bookId + ", bookTitle=" + bookTitle + ", bookAuthor=" + bookAuthor + ", category="
				+ category + ", availableCopies=" + availableCopies + "]";
	}
	
	

}
