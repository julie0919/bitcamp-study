// Data Persistence Framework 도입 - 좀 더 쉽게 Mybatis 설정 파일의 InputStream 얻는 방법
package com.eomcs.mybatis.ex01.a;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class Exam0130 {

  public static void main(String[] args) throws Exception {

    SqlSession sqlSession = new SqlSessionFactoryBuilder().build(Resources.getResourceAsStream(
        "com/eomcs/mybatis/ex01/a/mybatis-config.xml")).openSession();

    System.out.println("mybatis 사용 준비 완료!");

    sqlSession.close();
  }

}


