package pack.admin.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.UploadContext;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import pack.admin.model.MovieDto;
import pack.admin.model.MovieImpl;
import pack.admin.model.MovieInter;



@Controller
public class MovieMangerController {

	@Autowired
	@Qualifier("movieImpl")	//movieImple 을 Autowired한다
	private MovieImpl movieImpl;
	private int pageSize = 7;
	
	@Autowired	
	private FileValidator fileValidator; // 파일업로드를 위해 인젝션함 
	

	@RequestMapping("adminmovie")
	public ModelAndView list(@RequestParam(value = "pageNum", defaultValue = "1") String pageNum) {

		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize; // 0,3,6..
		int endRow = pageSize;
		int count = movieImpl.getCount(); // 페이징 처리를 위한 로직

		List<MovieDto> list = movieImpl.selectMovie(startRow); //영화 리스트를 list 에 담는다

		ModelAndView view = new ModelAndView();
		

		
		
		view.setViewName("admin/adminmovie");	//model and view 를 이용해 object 를 adminmovie에  넘긴다.
		view.addObject("list", list);
		view.addObject("currentPage", currentPage);
		view.addObject("count", count);
		view.addObject("pageSize", pageSize);
		view.addObject("what", "adminmovie"); // 페이지 클릭시 플래그 역할
		return view;

	}
	
	// 영화 검색을 위한 메소드
	@RequestMapping("adminmoviepart")
	public ModelAndView moviepart(moviePartBean bean) {

		int currentPage = Integer.parseInt(bean.getPageNum());
		int startRow = (currentPage - 1) * pageSize; // 0,3,6..
		bean.setStartRow(startRow); // startRow를 setter 에 넘겨 sql에 같이 넣어줌
		int endRow = pageSize;
		int count = movieImpl.getmovieCount(bean); // 페이지 번호 링크 달기용		
		List<MovieDto> list = movieImpl.moviePart(bean); // 특정 값만 list 에 담는다

		ModelAndView view = new ModelAndView();

		view.setViewName("admin/adminmovie");
		view.addObject("search", bean.getSearch());
		view.addObject("list", list);
		view.addObject("currentPage", currentPage);
		view.addObject("count", count);
		view.addObject("pageSize", pageSize);
		view.addObject("what", "adminmoviepart");
		return view;
	}
	
	// 영화 추가 메소드
	@RequestMapping(value = "movieinsert", method = RequestMethod.POST)
	public String insertProcess(MovieBean bean, BindingResult result ,HttpServletRequest request) { //movie bean 에는 업로드 파일이 image setter로 들어오게됌  
		InputStream inputStream = null;
		OutputStream outputStream = null;
	
		
		// 업로드한 파일에 대한 에러 검사
		MultipartFile file = bean.getImage(); //movie bean 의 MultipartFile image 를 file 변수에 담은후 처리
		fileValidator.validate(bean, result);

		String fileName = file.getOriginalFilename();
		System.out.println(fileName);
		if (result.hasErrors()) {
			return "error";

		}
		try {
			inputStream = file.getInputStream();
			String root_path = request.getSession().getServletContext().getRealPath("/"); // # HttpServletRequest 를 통해 절대경로를 생성 및	
		
			File newFile = new File(root_path + "resources/images/" + fileName); //파일업로드 주소 작성
			//file.transferTo(newFile);
			if (!newFile.exists()) {
				newFile.createNewFile();
			}
			outputStream = new FileOutputStream(newFile);
			int read = 0;
			byte[] bytes = new byte[1024];	//파일의 크기 설정 
			while ((read = inputStream.read(bytes)) != -1) {
				outputStream.write(bytes, 0, read);

			}
			
		} catch (Exception e) {
			System.out.println("filesubmit err:" + e);
		} finally {
			try {
				outputStream.close();

			} catch (Exception e2) {
				// TODO: handle exception
			}

		}			
		bean.setImage2(fileName);
		System.out.println(bean.getImage2());
		
		
		ImageBean bean2 = new ImageBean();
		
		bean2.setImage(fileName); 
		bean2.setImage(bean.getName()); //setter 를 이용해 파일이름을 넣어줌 
		
		//movieBean.setImage("123.jpg");
		 
		boolean b = movieImpl.insertMovieData(bean); //영화 테이블에 자료 insert
		//boolean d = movieImpl.insertimageData(bean2);
		boolean c = movieImpl.insertMovieActor(bean); // actor 테이블에 자료 insert

		try {
			if (b) {
				return "redirect:/adminmovie";

			} else
				return "redirect:/error";

		} catch (Exception e) {
			return "redirect:/error";
		}

	}
	
	
	
	//영화 수정하기(영화 추가와 동일하다)
	@RequestMapping(value = "movieupdate", method = RequestMethod.POST)
	public String updateProcess(MovieBean bean, BindingResult result, HttpServletRequest request ) {
		String a = bean.getCommon();
		System.out.println(a);
		InputStream inputStream = null;
		OutputStream outputStream = null;
	
		System.out.println("안녕하세용");
		// 업로드한 파일에 대한 에러 검사
		MultipartFile file = bean.getImage();
		fileValidator.validate(bean, result);

		String fileName = file.getOriginalFilename();
		System.out.println(fileName);
		if (result.hasErrors()) {
			return "error";

		}
		try {
			inputStream = file.getInputStream();

			String root_path = request.getSession().getServletContext().getRealPath("/");			
			
			File newFile = new File(root_path + "resources/images/" + fileName); //파일업로드 주소 작성
			if (!newFile.exists()) {
				newFile.createNewFile();
			}
			outputStream = new FileOutputStream(newFile);
			int read = 0;
			byte[] bytes = new byte[1024];
			while ((read = inputStream.read(bytes)) != -1) {
				outputStream.write(bytes, 0, read);

			}
		} catch (Exception e) {
			System.out.println("filesubmit err:" + e);
		} finally {
			try {
				outputStream.close();

			} catch (Exception e2) {
				// TODO: handle exception
			}

		}			
		bean.setImage2(fileName);
		 
		boolean b = movieImpl.updateMovieData(bean);
		boolean c = movieImpl.updateMovieActor(bean);

		try {
			if (b) {
				return "redirect:/adminmovie";

			} else
				return "error";

		} catch (Exception e) {
			return "error";
		}

	}
	
	
	//영화 삭제
	@RequestMapping(value = "moviedelete", method = RequestMethod.GET)
	public String delteprocess(@RequestParam(value = "name") String name) {
	

		boolean b = movieImpl.deleteMovieData(name); //영화 삭제
		movieImpl.deleteActorData(name); //그 영화의 actor 삭제
	

		try {
			if (b) {
				return "redirect:/adminmovie";

			} else
				return "error";

		} catch (Exception e) {
			return "error";
		}

	}
	
}
