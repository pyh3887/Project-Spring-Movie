package pack.lcg.model;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;


import pack.lcg.controller.GogekBean;
import pack.lcg.controller.UploadProfileBean;

public interface GogekAnnoInter {
	
	// 회원가입
	@Insert("insert into team.gogek (gogek_id, gogek_passwd, gogek_passwd1, gogek_name, gogek_age, gogek_email,gogek_date) values (#{gogek_id}, #{gogek_passwd}, #{gogek_passwd1}, #{gogek_name}, #{gogek_age}, #{gogek_email},now())")
	public boolean insertData(GogekBean bean);
	
	// 아이디 비밀번호 일치 여부
	@Select("SELECT * FROM admin WHERE id = #{gogek_id} and passwd = #{gogek_passwd}" )
	public AdmincheckDto selectadminLoginData(AdminIdCheckBean bean);

	// 아이디 비밀번호 일치 여부
	@Select("SELECT gogek_id, gogek_passwd,gogek_image FROM team.gogek WHERE gogek_id = #{gogek_id}")
	public GogekDto selectLoginData(String gogek_id);
		
	// 아이디 중복체크
	@Select("select count(*) from team.gogek where gogek_id = #{gogek_id}")
	public int selectIdCheck(String gogek_id);
	
	// 회원 정보 수정할 아이디 검사
	@Select("select * from team.gogek where gogek_id = #{gogek_id}")
	public GogekDto selectGogekOneData(String gogek_id);
	
	// 수정할 아이디 검사 후 mypage.jsp 첫 ajax success 이후 실행을 위한 sql문
	@Select("select * from gogek where gogek_id = #{gogek_id}")
	public List<GogekDto> selectData(String gogek_id);

	// 회원 정보 수정
	@Update("update team.gogek set gogek_passwd = #{gogek_passwd}, gogek_name = #{gogek_name}, gogek_age = #{gogek_age}, gogek_email = #{gogek_email} where gogek_id = #{gogek_id}")
	public boolean updateData(GogekBean bean);
	
	// 회원 정보 수정
//	@Update("update team.gogek set gogek_passwd = #{gogek_passwd}, gogek_name = #{gogek_name}, gogek_age = #{gogek_age}, gogek_email = #{gogek_email} where gogek_id = #{gogek_id}")
//	public GogekDto updateData(String gogek_id);
	
	@Delete("delete from gogek where gogek_id = #{gogek_id}")
	public boolean deleteData(String gogek_id);
	
	@Select("select count(*) from gogek where gogek_id =#{gogek_id} and gogek_passwd = #{gogek_passwd}")
	public int checkData(GogekBean bean);
	
	@Select("select * from gogek where gogek_id = #{gogek_id}")
	public  GogekDto getMail_Pwd(String gogek_id);
	
	@Insert("insert into deletemem (gogek_id, reason_num, del_date) values (#{gogek_id}, #{reason_num}, now())")
	public boolean deleteinsertData(GogekBean bean);
	
	// 아이디 찾기를 위한 회원가입시 이메일 중복체크
		@Select("select count(*) from team.gogek where gogek_email = #{gogek_email}")
		public int emailCheck(String gogek_email);
		
		// 계정 찾기 모달 띄우고 아이디 찾기 버튼 클릭시
		@Select("SELECT gogek_email, gogek_name, gogek_id FROM team.gogek WHERE gogek_email = #{gogek_email}")
		public GogekDto selectFindData(String gogek_email);
		
		
		@Select("select * from gogek where gogek_email = #{gogek_email}")
		public List<GogekDto> gogekListData(String gogek_email);
		
		@Update("update gogek set gogek_image = #{filename} where gogek_id = #{gogek_id}")
		boolean updateprofile(UploadProfileBean bean);
		
		
		// 띄울 프로필 회원 정보 검색
		@Select("select * from team.gogek where gogek_id = #{gogek_id}")
		public GogekDto selectGogekProfileData(String gogek_id);
		
		// 아작스로 회원 정보 출력
		@Select("SELECT * FROM team.gogek WHERE gogek_id = #{gogek_id}")
		public List<GogekDto> selectProfileData(String gogek_id);
		
		
	
		
		@Insert("insert into team.gogek (gogek_id,gogek_passwd,gogek_passwd1, gogek_name,gogek_email,gogek_date) values (#{gogek_id}, '123','123','동동이',#{gogek_email},now())")
		public boolean insertDataNaver(GogekBean bean);
		
		@Select("select * from gogek where gogek_id = #{gogek_id}")
		public  GogekDto selectDataNaver(String gogek_id);
}

