package pack.lcg.model;

import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;

import pack.lcg.controller.GogekBean;
import pack.lcg.controller.UploadProfileBean;

public interface GogekInter {
		
	boolean insertData(GogekBean bean) throws DataAccessException;
	boolean updateData(GogekBean bean) throws DataAccessException;
	GogekDto selectLoginData(String gogek_id) throws DataAccessException;
	GogekDto selectGogekOneData(String gogek_id) throws DataAccessException;
//	GogekDto updateData(String gogek_id) throws DataAccessException;
	int idCheck(String gogek_id) throws DataAccessException;
	List<GogekDto> selectData(String gogek_id);
	boolean deleteData(String gogek_id);
	public int checkData(GogekBean bean);
	GogekDto getMail_Pwd(String gogek_id);
	boolean deleteinsertData(GogekBean bean);
	AdmincheckDto selectadminLoginData(AdminIdCheckBean bean) throws DataAccessException;
	
	
	boolean updateprofile(UploadProfileBean bean);
	int emailCheck(String gogek_email);
	
	List<GogekDto> selectProfileData(String gogek_id);
	GogekDto selectGogekProfileData(String gogek_id);
	
	GogekDto selectFindData(String gogek_email);
	List<GogekDto> gogekListData(String gogek_email);
	boolean insertDataNaver(GogekBean bean);   //naver id로 로그인 시 첫 로그인이면 insert해줌
	GogekDto selectDataNaver(String gogek_id);  //naver 로그인시 select 조회 했을 때 id 존재하는지 여부
}
