// SqlSession 사용법 - SQL문을 실행하는 메서드
package com.eomcs.mybatis.ex02.a;

import java.util.List;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import com.eomcs.mybatis.vo.Board;

public class Exam0110 {

  public static void main(String[] args) throws Exception {

    SqlSession sqlSession = new SqlSessionFactoryBuilder().build(Resources.getResourceAsStream(
        "com/eomcs/mybatis/ex02/a/mybatis-config.xml")).openSession();

    List<Board> boards = sqlSession.selectList("BoardMapper.selectBoard");

    System.out.println(boards.size());

    sqlSession.close();
  }

}


