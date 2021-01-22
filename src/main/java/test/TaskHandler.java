package test;

import java.sql.Date;

public class TaskHandler {
  // 작업 데이터
  static final int TLENGTH = 100;
  static int[] tno = new int[TLENGTH];
  static String[] tcontent = new String[TLENGTH];
  static Date[] tdeadline = new Date[TLENGTH];
  static String[] towner = new String[TLENGTH];
  static int[] tstatus = new int[TLENGTH];
  static int tsize = 0;

  static void add() {
    System.out.println("[작업 등록]");

    tno[tsize] = Prompt.promptInt("번호? ");
    tcontent[tsize] = Prompt.string("내용? ");
    tdeadline[tsize] = Prompt.date("마감일? ");
    tstatus[tsize] = Prompt.promptInt("상태?\n0: 신규\n1: 진행중\n2: 완료\n> ");
    towner[tsize] = Prompt.string("담당자? ");

    tsize++;
  }

  static void list() {
    System.out.println("[작업 목록]");

    for (int i = 0; i < tsize; i++) {
      String stateLabel = null;
      switch (tstatus[i]) {
        case 1:
          stateLabel = "진행중";
          break;
        case 2:
          stateLabel = "완료";
          break;
        default:
          stateLabel = "신규";
      }
      // 번호, 작업명, 마감일, 프로젝트, 상태, 담당자
      System.out.printf("%d, %s, %s, %s, %s\n", // 출력 형식 지정
          tno[i], tcontent[i], tdeadline[i], stateLabel, towner[i]);
    }
  }
}
