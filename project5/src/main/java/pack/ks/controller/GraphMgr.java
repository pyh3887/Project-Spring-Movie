package pack.ks.controller;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import pack.mybatis.SqlMapConfig;

public class GraphMgr {
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
	
	public int selectPoint1(String name) {
		SqlSession sqlSession = factory.openSession();
		int point1 = 0;
		try {
			SqlMapperInter inter = sqlSession.getMapper(SqlMapperInter.class);
			point1 = inter.point1(name);
		} catch (Exception e) {
			System.out.println("selectReview err : " + e);
			sqlSession.rollback();
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		return point1;
	}
	
	public int selectPoint2(String name) {
		SqlSession sqlSession = factory.openSession();
		int point2 = 0;
		try {
			SqlMapperInter inter = sqlSession.getMapper(SqlMapperInter.class);
			point2 = inter.point2(name);
		} catch (Exception e) {
			System.out.println("selectReview err : " + e);
			sqlSession.rollback();
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		return point2;
	}
	
	public int selectPoint3(String name) {
		SqlSession sqlSession = factory.openSession();
		int point3 = 0;
		try {
			SqlMapperInter inter = sqlSession.getMapper(SqlMapperInter.class);
			point3 = inter.point3(name);
		} catch (Exception e) {
			System.out.println("selectReview err : " + e);
			sqlSession.rollback();
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		return point3;
	}
	
	public int selectPoint4(String name) {
		SqlSession sqlSession = factory.openSession();
		int point4 = 0;
		try {
			SqlMapperInter inter = sqlSession.getMapper(SqlMapperInter.class);
			point4 = inter.point4(name);
		} catch (Exception e) {
			System.out.println("selectReview err : " + e);
			sqlSession.rollback();
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		return point4;
	}
	
	public int selectPoint5(String name) {
		SqlSession sqlSession = factory.openSession();
		int point5 = 0;
		try {
			SqlMapperInter inter = sqlSession.getMapper(SqlMapperInter.class);
			point5 = inter.point5(name);
		} catch (Exception e) {
			System.out.println("selectReview err : " + e);
			sqlSession.rollback();
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		return point5;
	}
}
