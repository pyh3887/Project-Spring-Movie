package pack.lcg.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import pack.admin.controller.ImageBean;
import pack.admin.controller.MovieBean;
import pack.ks.model.GogekDto;
import pack.lcg.model.GogekInter;

@Controller
public class UploadController {
	@Autowired
	private FileValidator9 fileValidator;
	
	@Autowired
	@Qualifier("gogekImpl")
	private GogekInter gogekInter;

	@RequestMapping(value = "upload", method = RequestMethod.GET)
	public String getForm(@ModelAttribute("uploadFile") UploadFile uploadFile) {

		return "uploadform";

	}

	@RequestMapping(value = "upload", method = RequestMethod.POST)
	public String filesubmit(@ModelAttribute("uploadFile") UploadFile uploadFile, BindingResult result,
			UploadProfileBean bean,HttpSession session
			) {
		
		session.removeAttribute("image");

		
		
		InputStream inputStream = null;
		OutputStream outputStream = null;

		// 업로드한 파일에 대한 에러 검사
		MultipartFile file = uploadFile.getFile();
		fileValidator.validate(uploadFile, result);

		String fileName = file.getOriginalFilename();
		bean.setFilename(fileName);
		if (result.hasErrors()) {
			return "error";

		}
		try {
			inputStream = file.getInputStream();

			File newFile = new File(
					"\\work\\jsou\\project5\\src\\main\\webapp\\resources\\gogek\\"
							+ fileName);
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
		
		pack.lcg.model.GogekDto dto = gogekInter.selectLoginData(bean.getGogek_id());

		session.setAttribute("image", dto.getGogek_image());
		
		
		// movieBean.setImage("123.jpg");
		
		boolean b = gogekInter.updateprofile(bean);

		try {
			if (b) {
				return "gogek/mypage";

			} else
				return "error";

		} catch (Exception e) {
			return "error";
		}

	}

}
