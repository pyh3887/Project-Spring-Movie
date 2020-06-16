package pack.admin.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import pack.admin.model.MovieDto;
import pack.admin.model.MovieImpl;
import pack.admin.model.MovieInter;
import pack.admin.model.TvDto;
import pack.admin.model.TvImpl;
import pack.yj.controller.TvBean;

@Controller
public class TVMangerController {
	

	@Autowired
	@Qualifier("tvImpl")
	private TvImpl tvImpl; //tvImpl 을 Autowired한다
	private int pageSize = 7;
	
	@Autowired	
	private FileValidator2 fileValidator2; 	// 파일업로드를 위해 인젝션함

	@RequestMapping("tvshow")
	public ModelAndView list(@RequestParam(value = "pageNum", defaultValue = "1") String pageNum) {
		
		// 페이징 처리를 위한 로직
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize; // 0,3,6..
		int endRow = pageSize;
		int count = tvImpl.gettvCount(); // 페이지 번호 링크 달기용
										
		List<TvDto> list = tvImpl.selecttv(startRow);  	//영화 리스트를 list 에 담는다
		
		ModelAndView view = new ModelAndView();
		
		view.setViewName("admin/admintv"); 	//model and view 를 이용해 object 를 admintv에  넘긴다.
		view.addObject("list", list);
		view.addObject("currentPage", currentPage);
		view.addObject("count", count);
		view.addObject("pageSize", pageSize);
		view.addObject("what", "tvshow"); // 페이지 클릭시 플래그 역할
		return view;

	}
	
	//tv 자료 검색
	@RequestMapping("admintvpart")
	public ModelAndView moviepart(tvPartBean bean) {

		int currentPage = Integer.parseInt(bean.getPageNum());
		int startRow = (currentPage - 1) * pageSize; // 0,3,6..
		bean.setStartRow(startRow); 	 // startRow를 setter 에 넘겨 sql에 같이 넣어줌
		int endRow = pageSize;
		int count = tvImpl.gettvCount(bean); 	// 페이지 번호 링크 달기용		
		
		List<TvDto> list = tvImpl.tvPart(bean); // 특정 값만 list 에 담는다	
				
		
		ModelAndView view = new ModelAndView();

		view.setViewName("admin/admintv");
		view.addObject("search", bean.getSearch());
		view.addObject("list", list);
		view.addObject("currentPage", currentPage);
		view.addObject("count", count);
		view.addObject("pageSize", pageSize);
		view.addObject("what", "admintvpart");
		return view;

	}
	
		
		
	//tv 자료 추가하기	
	@RequestMapping(value = "tvinsert", method = RequestMethod.POST)
	public String insertProcess(pack.admin.controller.TvBean bean, BindingResult result ) {
		//tv bean 에는 업로드 파일이 image setter로 들어오게됌
		
		System.out.println("dasdfasdfasdfadsf");
		System.out.println(bean.getImage());
		System.out.println(bean.getName());
		InputStream inputStream = null;
		OutputStream outputStream = null;
	
		
		// 업로드한 파일에 대한 에러 검사
		MultipartFile file = bean.getImage();  //movie bean 의 MultipartFile image 를 file 변수에 담은후 처리
		fileValidator2.validate(bean, result);

		String fileName = file.getOriginalFilename();
		System.out.println(fileName);
		if (result.hasErrors()) {
			return "error";

		}
		try {
			inputStream = file.getInputStream();

			File newFile = new File("\\webapp\\resources\\images\\" + fileName); //파일업로드 주소 작성
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
		bean.setImage2(fileName); 	//setter 를 이용해 파일이름을 넣어줌 
		System.out.println(bean.getImage2());
				
		
		//movieBean.setImage("123.jpg");
		 
		boolean b = tvImpl.insertTvData(bean); //영화 테이블에 자료 insert
		boolean c = tvImpl.insertTvActor(bean); // actor 테이블에 자료 insert
		

		try {
			if (b) {
				return "redirect:/tvshow";

			} else
				return "redirect:/error";

		} catch (Exception e) {
			return "redirect:/error";
		}

	}

	
	
	//추가 자료 수정하기 (추가 와 동일)
	@RequestMapping(value = "tvupdate", method = RequestMethod.POST)
	public String updateProcess(pack.admin.controller.TvBean bean, BindingResult result ) {
	
		System.out.println(bean.getImage());
		System.out.println(bean.getName());
		InputStream inputStream = null;
		OutputStream outputStream = null;
	
		
		// 업로드한 파일에 대한 에러 검사
		MultipartFile file = bean.getImage();
		fileValidator2.validate(bean, result);

		String fileName = file.getOriginalFilename();
		System.out.println(fileName);
		if (result.hasErrors()) {
			return "error";

		}
		try {
			inputStream = file.getInputStream();

			File newFile = new File("\\webapp\\resources\\images\\" + fileName);
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
		System.out.println(bean.getImage2());
				
		
		//movieBean.setImage("123.jpg");
		boolean b =tvImpl.updatetvData(bean);
		boolean c = tvImpl.updatetvActorData(bean);

		try {
			if (b) {
				return "redirect:/tvshow";

			} else
				return "error";

		} catch (Exception e) {
			return "error";
		}

	}	
	
	
	
	//tv 프로그램 삭제
	@RequestMapping(value = "admintvdelete", method = RequestMethod.GET)
	public String delteprocess(@RequestParam(value = "name") String name) {
	

		boolean b = tvImpl.deletetveData(name); // 선택 tv 프로그램 삭제
		tvImpl.deleteTvActordata(name); // 그 프로그램의 actor 도 삭제

		try {
			if (b) {
				return "redirect:/tvshow";

			} else
				return "error";

		} catch (Exception e) {
			return "error";
		}

	}
	
}
