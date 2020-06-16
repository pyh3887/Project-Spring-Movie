package pack.ks.controller;

import org.apache.ibatis.annotations.Select;


public interface SqlMapperInter {	// 별점을 출력하기위해 자바 빈을 사용했다.
	
	@Select("select count(point) as po from star where pro_name = #{name} AND POINT = 1")
	public int point1(String name);
	@Select("select count(point) as po from star where pro_name = #{name} AND POINT = 2")
	public int point2(String name);
	@Select("select count(point) as po from star where pro_name = #{name} AND POINT = 3")
	public int point3(String name);
	@Select("select count(point) as po from star where pro_name = #{name} AND POINT = 4")
	public int point4(String name);
	@Select("select count(point) as po from star where pro_name = #{name} AND POINT = 5")
	public int point5(String name);
}
