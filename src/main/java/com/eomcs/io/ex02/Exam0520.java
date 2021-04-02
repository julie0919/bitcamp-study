// Byte Stream - 텍스트 데이터 읽기
package com.eomcs.io.ex02;

import java.io.FileInputStream;

public class Exam0520 {

  public static void main(String[] args) throws Exception {
    StringBuffer strbuf = new StringBuffer();

    FileInputStream in = new FileInputStream("sample/ms949.txt");

    int b = 0;

    // MS949 로 인코딩된 텍스트 읽기
    // 단순히 1바이트를 읽어서는 안된다.
    // 영어는 1바이트를 읽으면 되지만,
    // 한글은 2바이트를 읽어야한다.
    while ((b = in.read()) != -1) {
      if (b >= 0xb0a1) { // 읽은 바이트가 한글에 해당한다면,
        // 1 바이트를 더 읽어서 기존에 읽은 바이트뒤에 붙여 2바이트로 만든다.
        b = b << 8 | in.read();
      }
      System.out.printf("%x\n", b);
    }
    /*
    // 'A' 문자 읽기
    int b = in.read(); // 1byte 읽기
    System.out.printf("%x\n", b);

    // 'B' 문자 읽기
    b = in.read(); // 1byte 읽기
    System.out.printf("%x\n", b);

    // MS949로 문자를 저장하면, 한글은 2바이트로 저장된다.
    // 따라서 한글을 읽을 때는 2바이트를 묶어서 읽어야 한다.
    // '가' 문자 읽기
    b = in.read() << 8 | in.read(); // 2byte 읽기
    System.out.printf("%x\n", b);

    // '각' 문자 읽기
    b = in.read() << 8 | in.read(); // 2byte 읽기
    System.out.printf("%x\n", b);
     */
    in.close();

    System.out.println(strbuf.toString());
  }


}
