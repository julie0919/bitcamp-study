package test;

import java.sql.Date;

public class ProjectHandler {
  // 프로젝트 데이터
  static final int PLENGTH = 100;
  static int[] pno = new int[PLENGTH];
  static String[] ptitle = new String[PLENGTH];
  static String[] pcontent = new String[PLENGTH];
  static Date[] pstartDate = new Date[PLENGTH];
  static Date[] pendDate = new Date[PLENGTH];
  static String[] powner = new String[PLENGTH];
  static String[] pmembers = new String[PLENGTH];  
  static int psize = 0;

  static void add() {
    System.out.println("[프로젝트 등록]");

    pno[psize] = Prompt.promptInt("번호? ");
    ptitle[psize] = Prompt.string("프로젝트명? ");
    pcontent[psize] = Prompt.string("내용? ");
    pstartDate[psize] = Prompt.date("시작일? ");
    pendDate[psize] = Prompt.date("종료일? ");
    powner[psize] = Prompt.string("만든이? ");
    pmembers[psize] = Prompt.string("팀원? ");

    psize++;
  }

  static void list() {
    System.out.println("[프로젝트 목록]");

    for (int i = 0; i < psize; i++) {
      // 번호, 프로젝트명, 시작일, 종료일, 만든이
      System.out.printf("%d, %s, %s, %s, %s\n", // 출력 형식 지정
          pno[i], ptitle[i], pstartDate[i], pendDate[i], powner[i]);
    }
  }


}
