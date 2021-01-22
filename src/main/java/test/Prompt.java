package test;

import java.sql.Date;
import java.util.Scanner;

public class Prompt {
  static Scanner keyboardScan = new Scanner(System.in);

  static String string(String title) {
    System.out.print(title);
    return keyboardScan.nextLine();
  }

  static int promptInt(String title) {
    return Integer.parseInt(string(title));
  }

  static Date date(String title) {
    return Date.valueOf(string(title));
  }

  static void close() {
    keyboardScan.close();
  }

}
