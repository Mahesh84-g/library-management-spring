package com.mahesh.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.ui.Model;

import com.mahesh.model.BooksModel;

public class LibraryService {
	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	public void addBook(BooksModel bm) {
		 jdbcTemplate.update("insert into books values(?,?,?,?,?)",bm.getBookId(),bm.getBookTitle(),bm.getBookAuthor(),bm.getCategory(),bm.getAvailableCopies());
		 System.out.println("added to books table");
	 }
	 
	 public BooksModel  getBook(int id) {
		 BooksModel l=jdbcTemplate.query("select * from books where id=?",new alldetails(),id).getFirst();
		 return l;
		 
	 }
	 public void update(BooksModel bm) {
		 jdbcTemplate.update("update books set title=?,author=?,category=?,available_copies=? where id=?",bm.getBookTitle(),bm.getBookAuthor(),bm.getCategory(),bm.getAvailableCopies(),bm.getBookId());
		 System.out.println("update success");
	 }
	 public void delete(int id) {
		 jdbcTemplate.update("delete from books where id=?",id);
		 System.out.println("delete success");
	 }
	 
	 public List<BooksModel> searchallbooks(String key){
		 String k="%"+key+"%";
		 List<BooksModel> l=jdbcTemplate.query("select * from books where (title like ?) or (author like ?) or( category like ?) ",new alldetails(),k,k,k);
		 return l;
	 }
	 public List<BooksModel> allbooks(){
		 List<BooksModel> l=jdbcTemplate.query("select * from books",new alldetails());
		 return l;
	 }
	 
	 class alldetails implements RowMapper<BooksModel>{
		public BooksModel mapRow(ResultSet rs, int rowNum) throws SQLException {
			BooksModel b=new BooksModel();
			b.setBookId(rs.getInt("id"));
			b.setBookTitle(rs.getString("title"));
			b.setBookAuthor(rs.getString("author"));
			b.setCategory(rs.getString("category"));
			b.setAvailableCopies(rs.getInt("available_copies"));
			return b;
			
		}
	 }
	 
	 public List<BooksModel> addBBook(int book_id) {
		 int id=0;
		 if(checkBookId(book_id)==false) {
		 jdbcTemplate.update("insert into Borrowedbooks(id,book_id) values(?,?)",id,book_id);//adding into borrow table
		 }
		 else {
			 jdbcTemplate.update("update  Borrowedbooks set borrowed_copies=(borrowed_copies+1) where book_id=?",book_id);//adding into borrow table
		 }
		 jdbcTemplate.update("update books set available_copies=(available_copies-1) where id=?",book_id);//decrease available copies
		 jdbcTemplate.update("insert into transactions(book_id) values(?)",book_id);//entering transaction details
		 System.out.println("added to borrowed table");
		 List<BooksModel> l=jdbcTemplate.query("select b.*,bb.borrowed_copies as borrowed_copies from books b inner join Borrowedbooks bb on b.id=bb.book_id",new allVdetails());
         return l;
		 
	 }
	 class allVdetails implements RowMapper<BooksModel>{
			public BooksModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				BooksModel b=new BooksModel();
				b.setBookId(rs.getInt("id"));
				b.setBookTitle(rs.getString("title"));
				b.setBookAuthor(rs.getString("author"));
				b.setCategory(rs.getString("category"));
				b.setAvailableCopies(rs.getInt("available_copies"));
				b.setBorrowed_copies(rs.getInt("borrowed_copies"));
				return b;
				
			}
		 }
	 public boolean checkBookId(int book_id) {
		
		 List<Integer> l=jdbcTemplate.query("select book_id from Borrowedbooks",new allBookIds());
		 System.out.println(l);
		 for(Integer i:l) {
			 if(i==book_id) {
				 return true;
			 }
		 }
		 return false;
		 
	 }
	 class allBookIds implements RowMapper<Integer>{
			public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
				return rs.getInt("book_id");
				
			}
		 }
	 public List<BooksModel> getBorrowBook() {
		 List<BooksModel> l=jdbcTemplate.query("select b.*,bb.borrowed_copies as borrowed_copies from books b inner join Borrowedbooks bb on b.id=bb.book_id",new allVdetails());
         return l;
		 
	 }
	 public void returnBbook(int book_id,int copies) {
		 LocalDateTime now = LocalDateTime.now();
		 String formatted = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		 int id=0;
		 if(copies==1) {
		 jdbcTemplate.update("delete from Borrowedbooks where book_id=?",book_id);//removing from borrow table no books are ther
		 }
		 else {
			 jdbcTemplate.update("update  Borrowedbooks set borrowed_copies=(borrowed_copies-1) where book_id=?",book_id);//decresing  borrow_books count 
		 }
		 jdbcTemplate.update("update books set available_copies=(available_copies+1) where id=?",book_id);//decrease available copies
		 jdbcTemplate.update("update transactions set return_date=? where (book_id=?) and (return_date is null) limit 1;",formatted,book_id);//entering transaction details have book_id with return date null and having first among all same book_ids
		
	 }


}
