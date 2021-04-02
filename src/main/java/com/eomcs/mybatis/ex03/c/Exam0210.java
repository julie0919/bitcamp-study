// update 문 실행
package com.eomcs.mybatis.ex03.c;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import com.eomcs.mybatis.vo.Board;

public class Exam0210 {

  public static void main(String[] args) throws Exception {

    SqlSession sqlSession = new SqlSessionFactoryBuilder().build(Resources.getResourceAsStream(
        "com/eomcs/mybatis/ex03/c/mybatis-config.xml")).openSession(true);

    Board board = new Board();
    board.setNo(2);
    board.setTitle("제목 변경!!!");
    board.setContent("내용 변경!!!");

    int count = sqlSession.update("BoardMapper.update", board);

    System.out.printf("%d 개의 데이터를 변경했음!\n", count);

    sqlSession.commit();

    sqlSession.close();
    System.out.println("실행 완료!");
  }

}


