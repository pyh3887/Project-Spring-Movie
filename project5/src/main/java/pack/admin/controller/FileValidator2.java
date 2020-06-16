package pack.admin.controller;

import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Service
public class FileValidator2 implements Validator{
	
	@Override
	public boolean supports(Class<?> clazz) {
	
		return false;
	}
	
	@Override
	public void validate(Object tvbean, Errors errors) {
		TvBean file = (TvBean)tvbean;
		
		if(file.getImage().getSize() == 0 ) {
			errors.rejectValue("file", "", "업로드할 파일을 선택하시오");
		}
		// tv 프로그램 생성, 수정시 파일업로드
	}
	
}
