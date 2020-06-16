package pack.lcg.model;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import pack.lcg.controller.GogekBean;
import pack.lcg.controller.UploadProfileBean;

@Repository
public class GogekImpl implements GogekInter {

	@Autowired
	private GogekAnnoInter gogekAnnoInter;

	// 회원 가입
	@Override
	public boolean insertData(GogekBean bean) {
		// System.out.println("고객 어노 인터 " + bean.getGogek_passwd());
		// System.out.println("고객 어노 인터 " + bean.getGogek_passwd1());
		return gogekAnnoInter.insertData(bean);
	}

	// 로그인 일치 여부 LoginContoller
	@Override
	public GogekDto selectLoginData(String gogek_id) {
		// System.out.println("gogekImp 로그인일치 id "+bean.getGogek_id());
		// System.out.println("gogekImp 로그인일치 passwd"+bean.getGogek_passwd());
		return gogekAnnoInter.selectLoginData(gogek_id);
	}

	// gogek_id 충복체크 idCheckController
	@Override
	public int idCheck(String gogek_id) {
		System.out.println("gogekImpl selectCheck " + gogek_id);
		return gogekAnnoInter.selectIdCheck(gogek_id);
	}

	// 회원 정보 수정을 위한 id 체크 UpdateController
	@Override
	public GogekDto selectGogekOneData(String gogek_id) {
		System.out.println();
		System.out.println("gogekImpl selectGogekOneData " + gogek_id);
		return gogekAnnoInter.selectGogekOneData(gogek_id);
	}


	// 회원 정보 수정 UpdateController
	@Override
	public boolean updateData(GogekBean bean) throws DataAccessException {
		// TODO Auto-generated method stub
		return gogekAnnoInter.updateData(bean);
	}

	// 회원탈퇴탈 아이디 존재하는지 조회
	@Override
	public List<GogekDto> selectData(String gogek_id) {
		return gogekAnnoInter.selectData(gogek_id);
	}

	// 회원 탈퇴
	@Override
	public boolean deleteData(String gogek_id) {
		return gogekAnnoInter.deleteData(gogek_id);
	}

	@Override
	public int checkData(GogekBean bean) {
		return gogekAnnoInter.checkData(bean);
	}

	@Override
	public GogekDto getMail_Pwd(String gogek_id) {
		return gogekAnnoInter.getMail_Pwd(gogek_id);

	}

	
	// 탈퇴 사유 관련자료 기입
	@Override
	public boolean deleteinsertData(GogekBean bean) {
		return gogekAnnoInter.deleteinsertData(bean);
	}
	
	// 이메일 중복 체크 확인
	@Override
	public int emailCheck(String gogek_email) {
		// TODO Auto-generated method stub
		return gogekAnnoInter.emailCheck(gogek_email);
	}

	// 아이디 찾을떄 사용
	@Override
	public GogekDto selectFindData(String gogek_email) {
		// TODO Auto-generated method stub
		return gogekAnnoInter.selectFindData(gogek_email);
	}

	
	@Override
	public List<GogekDto> gogekListData(String gogek_email) {
		// TODO Auto-generated method stub
		return gogekAnnoInter.gogekListData(gogek_email);
	}
	
	// 어드민 로그인 경우 어드민창으로 별도로 넘겨줌
	@Override
	public AdmincheckDto selectadminLoginData(AdminIdCheckBean bean) throws DataAccessException {
		// TODO Auto-generated method stub
		return gogekAnnoInter.selectadminLoginData(bean);
	}
	
	// 프로필 정보 수정
	@Override
	public boolean updateprofile(UploadProfileBean bean) {
		return gogekAnnoInter.updateprofile(bean);
	
	}
	
	// 조회된 회원 프로필 출력
	@Override
	public List<GogekDto> selectProfileData(String gogek_id) {
		// TODO Auto-generated method stub
		return gogekAnnoInter.selectProfileData(gogek_id);
	}
	
	// 프로필 출력할 로그인한 회원 조회
	@Override
	public GogekDto selectGogekProfileData(String gogek_id) {
		// TODO Auto-generated method stub
		return gogekAnnoInter.selectGogekProfileData(gogek_id);
	}
	
	// 네이버로 회원가입
	@Override
	public boolean insertDataNaver(GogekBean bean) {
		return gogekAnnoInter.insertDataNaver(bean);
	}
	// 네이버 계정 정보 조회
	@Override
	public GogekDto selectDataNaver(String gogek_id) {
		return gogekAnnoInter.selectDataNaver(gogek_id);
	}

}
