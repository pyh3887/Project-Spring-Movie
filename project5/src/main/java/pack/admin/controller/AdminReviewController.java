package pack.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import pack.admin.model.MovieDto;
import pack.admin.model.MovieImpl;
import pack.admin.model.ReviewDto;
import pack.admin.model.AdminReviewImpl;

@Controller
public class AdminReviewController {

	@Autowired
	private AdminReviewImpl reviewImpl;
	private int pageSize = 10;

	@RequestMapping("review")
	public ModelAndView list(@RequestParam(value = "pageNum", defaultValue = "1") String pageNum) {

		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize; // 0,3,6..
		int endRow = pageSize;
		int count = reviewImpl.reviewCount();

		System.out.println(count + " " + pageSize + " " + startRow);
		List<ReviewDto> list = reviewImpl.reviewlist(startRow);
		ModelAndView view = new ModelAndView();

		view.setViewName("admin/adminreview");
		view.addObject("list", list);
		view.addObject("currentPage", currentPage);
		view.addObject("count", count);
		view.addObject("pageSize", pageSize);
		view.addObject("what", "review");
		view.addObject("kind", "1");

		return view;

	}

	@RequestMapping("reviewsearch")
	public ModelAndView part(@RequestParam(value = "pageNum", defaultValue = "1") String pageNum, ReviewSearch search) {

		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize; // 0,3,6..
		int endRow = pageSize;
		int count = reviewImpl.reviewsearchCount(search);

		System.out.println(count + " " + pageSize + " " + startRow);
		search.setStartRow(startRow);

		if (search.getSearch() == "") {
			List<ReviewDto> list = reviewImpl.reviewlist(startRow);
			ModelAndView view = new ModelAndView();
			view.setViewName("admin/adminreview");
			view.addObject("list", list);
			view.addObject("currentPage", currentPage);
			view.addObject("count", count);
			view.addObject("pageSize", pageSize);
			view.addObject("what", "reviewsearch");
			view.addObject("kind", "1");
			return view;

		} else {

			List<ReviewDto> list = reviewImpl.reviewsearchlist(search);

			ModelAndView view = new ModelAndView();
			view.setViewName("admin/adminreview");
			view.addObject("data", search.getData());
			view.addObject("search", search.getSearch());			
			view.addObject("list", list);
			view.addObject("currentPage", currentPage);
			view.addObject("count", count);
			view.addObject("pageSize", pageSize);
			view.addObject("kind", "1");
			return view;

		}

	}

	@RequestMapping("adminrecommend")
	public ModelAndView recommendFunc(@RequestParam(value = "pageNum", defaultValue = "1") String pageNum) {

		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize; // 0,3,6..
		int endRow = pageSize;
		int count = reviewImpl.reviewCount();

		System.out.println(count + " " + pageSize + " " + startRow);
		List<ReviewDto> list = reviewImpl.recommenddata(startRow);

		ModelAndView view = new ModelAndView();

		view.setViewName("admin/adminreview");
		view.addObject("list", list);
		view.addObject("currentPage", currentPage);
		view.addObject("count", count);
		view.addObject("pageSize", pageSize);
		view.addObject("what", "adminrecommend");
		view.addObject("kind", "1");
		return view;

	}

	@RequestMapping("adminreport")
	public ModelAndView adminreport(@RequestParam(value = "pageNum", defaultValue = "1") String pageNum) {

		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize; // 0,3,6..
		int endRow = pageSize;
		int count = reviewImpl.reviewCount();

		System.out.println(count + " " + pageSize + " " + startRow);
		List<ReviewDto> list = reviewImpl.reportdata(startRow);

		ModelAndView view = new ModelAndView();

		view.setViewName("admin/adminreview");
		view.addObject("list", list);
		view.addObject("currentPage", currentPage);
		view.addObject("count", count);
		view.addObject("pageSize", pageSize);
		view.addObject("what", "adminreport");
		view.addObject("kind", "2");
		return view;

	}
	

	@RequestMapping(value = "reviewdelete", method = RequestMethod.GET)
	public String delteprocess(@RequestParam(value = "no") String no) {

		boolean b = reviewImpl.deletereviewData(no);

		try {
			if (b) {
				return "redirect:/review";

			} else
				return "error";

		} catch (Exception e) {
			return "error";
		}

	}

}
