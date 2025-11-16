package com.mahesh.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mahesh.model.BooksModel;
import com.mahesh.service.LibraryService;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	private LibraryService LibService;
	
	public void setLibService(LibraryService libService) {
		LibService = libService;
	}

	@RequestMapping("/studentMenu")
	public String studentmenu() {
		return "studentViews/studentMenu";
	}
	
	@RequestMapping("/studentSearchForm")
	public String searchform() {
		return "studentViews/searchForm";
	}
	
	@RequestMapping("/studentSearch")
	public String searchbooks(@RequestParam("key") String key,Model m) {
		m.addAttribute("bookList",LibService.searchallbooks(key));
		return "studentViews/display";
	}
	@RequestMapping("/sAllBooks")
	public String getallbooks(Model m) {
		m.addAttribute("bookList",LibService.allbooks());
		return "studentViews/display";
		
	}
	
	@RequestMapping("/takeBook")
	public String borrowbook(@RequestParam("id") int id,@RequestParam("copies") int copies,Model m,HttpSession s) {
		if(copies>0) {
			List<BooksModel> l=LibService.addBBook(id);
			s.setAttribute("borrowedList",l);
        return "redirect:/displayController";}
		else {
			System.out.println("no avalable copies");
			return "redirect:/errorController";
			
		}
	}
	@RequestMapping("/displayController")
	public String displaycontroller(HttpSession s,Model m) {
		
		m.addAttribute("borrowedList",(List<BooksModel>)s.getAttribute("borrowedList"));
					return "studentViews/borrowedDisplay";
	}
	@RequestMapping("/errorController")
	public String errorcontroller() {
		return "studentViews/noCopies";
	}
	
	@RequestMapping("/BorrowedDetails")
	public String getBookdetails() {
		return "redirect:/borrowcontroller";
	}
	@RequestMapping("/borrowcontroller")
	public String borrowcontroller(Model m) {
		List<BooksModel> l=LibService.getBorrowBook();
		m.addAttribute("borrowedList",l);
		return "studentViews/borrowedDisplay";
	}
	@RequestMapping("/returnBook")
	public String returnbook(@RequestParam("id") int id,@RequestParam("copies") int copies,Model m,HttpSession s) {
			LibService.returnBbook(id,copies);
			return "redirect:/BorrowedDetails";
	}

}
