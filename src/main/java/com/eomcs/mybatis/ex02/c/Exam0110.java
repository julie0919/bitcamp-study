// SqlSession 사용법 - select 문 실행하기: 자바 객체의 프로퍼티 이름과 컬럼명을 일치시키기I
package com.eomcs.mybatis.ex02.c;

import java.util.List;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import com.eomcs.mybatis.vo.Board;

public class Exam0110 {

  public static void main(String[] args) throws Exception {

    SqlSession sqlSession = new SqlSessionFactoryBuilder().build(Resources.getResourceAsStream(
        "com/eomcs/mybatis/ex02/c/mybatis-config.xml")).openSession();

    List<Board> boards = sqlSession.selectList("BoardMapper.selectBoard");

    for (Board b : boards) {
      System.out.printf("%d,%s,%s,%s,%d\n",
          b.getNo(),
          b.getTitle(),
          b.getContent(),
          b.getRegisteredDate(),
          b.getViewCount());
    }

    sqlSession.close();
  }

}


