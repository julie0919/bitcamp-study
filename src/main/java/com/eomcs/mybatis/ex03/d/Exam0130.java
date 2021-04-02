// auto commit - commit()
package com.eomcs.mybatis.ex03.d;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import com.eomcs.mybatis.vo.Board;

public class Exam0130 {

  public static void main(String[] args) throws Exception {

    SqlSession sqlSession = new SqlSessionFactoryBuilder().build(Resources.getResourceAsStream(
        "com/eomcs/mybatis/ex03/d/mybatis-config.xml")).openSession();

    Board board = new Board();
    board.setTitle("제목입니다zzz");
    board.setContent("내용입니다zzz");

    int count = sqlSession.insert("BoardMapper.insert", board);

    System.out.printf("%d 개의 데이터를 입력했음!\n", count);

    sqlSession.commit();
    sqlSession.close();
    System.out.println("실행 완료!");
  }

}

