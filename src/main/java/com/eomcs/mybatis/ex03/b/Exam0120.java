// SQL 문에 삽입할 파라미터 전달하기 - 일반 객체를 이용하여 여러 개의 값 넘기기
package com.eomcs.mybatis.ex03.b;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import com.eomcs.mybatis.vo.Board;

public class Exam0120 {

  public static void main(String[] args) throws Exception {

    SqlSession sqlSession = new SqlSessionFactoryBuilder().build(Resources.getResourceAsStream(
        "com/eomcs/mybatis/ex03/b/mybatis-config.xml")).openSession(true);

    Board board = new Board();
    board.setTitle("제목입니다");
    board.setContent("내용입니다");

    int count = sqlSession.insert("BoardMapper.insert", board);

    System.out.printf("%d 개의 데이터를 입력했음!\n", count);

    sqlSession.commit();

    sqlSession.close();
    System.out.println("실행 완료!");
  }

}


