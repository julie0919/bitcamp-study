// SqlSession 사용법 - 결과가 한 개일 때 => selectOne()
package com.eomcs.mybatis.ex02.e;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class Exam0110 {

  public static void main(String[] args) throws Exception {
    SqlSession sqlSession = new SqlSessionFactoryBuilder().build(Resources.getResourceAsStream(
        "com/eomcs/mybatis/ex02/e/mybatis-config.xml")).openSession();

    // selectOne()
    // - select 결과가 0 또는 1개 일때 호출할 수 있다.
    // - 여러 개의 결과가 나오는 select 문에 대해 호출하면 예외가 발생한다.
    // - 리턴 값은 한개의 결과 레코드 값을 담은 객체이다.
    // 

    List<Map<String,Object>> list = sqlSession.selectList("BoardMapper.selectBoard");

    // 각각의 Map 객체에는 레코드 값이 보관되어 있다.
    // - 즉 레코드의 각 컬럼 값이 Map 객체에 보관되어 있다.
    // - 컬럼 값을 꺼낼 때는 select 할 때 사용한 컬럼이름으로 꺼내야한다.
    // 
    for (Map<String,Object> map : list) {
      System.out.printf("%d,%s,%s,%s,%d\n",
          map.get("board_id"),
          map.get("title"),
          map.get("contents"),
          map.get("created_date"),
          map.get("view_count"));
    }

    sqlSession.close();
  }

}


