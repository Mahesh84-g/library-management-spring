package com.mahesh.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mahesh.model.BooksModel;
import com.mahesh.service.LibraryService;

@Controller
public class AdminController {
	private LibraryService LibService;

	public void setLibService(LibraryService libService) {
		LibService = libService;
	}
	@RequestMapping("adminMenu")
	public String adminMenuForm() {
		return "adminViews/adminMenu";
		
	}
	
	@RequestMapping("/addBooksForm")
	public String addBookForm() {
		return "adminViews/addBook";
	}
	@RequestMapping("addBookDetails")
	public String addbook(@ModelAttribute BooksModel bm) {
		LibService.addBook(bm);
		return "forward:/allBooks";
	}
	
	@RequestMapping("/allBooks")
	public String allbooks(Model m) {
		List<BooksModel> ls=LibService.allbooks();
		m.addAttribute("bookList",ls);
		return "adminViews/display";
	}
	@RequestMapping("/editForm")
	public String editForm(@RequestParam("id") int id,Model m) {
		m.addAttribute("book",LibService.getBook(id));
		return "adminViews/editForm";
	}
	@RequestMapping("/update")
	public String update(@ModelAttribute BooksModel bm) {
		LibService.update(bm);
		return "forward:/allBooks";
	}
	@RequestMapping("/delete")
	public String update(@RequestParam("id") int id) {
		LibService.delete(id);
		return "forward:/allBooks";
	}
	@RequestMapping("/SearchBooksForm")
	public String searchbookform() {
		return "adminViews/searchForm";
	}
	@RequestMapping("/search")
	public String searchbook(@RequestParam("key") String key,Model m) {
		m.addAttribute("bookList",LibService.searchallbooks(key));
		return "adminViews/display";
	}
}
