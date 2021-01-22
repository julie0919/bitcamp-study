package test;

public class App2 {
  public static void main(String [] args) {
    // 메모리 설계도
    class Member {
      String name;
      int age;
      boolean working;
    }
    // 새 설계도에 따라 메모리(변수들을) 준비한다
    Member m1 = new Member();
    // m1 =>

    // 인스턴스 변수에 값 넣기
    m1.name = "홍길동";
    m1.age = 20;
    m1.working = false;


    System.out.printf("이름: %s\n", m1.name);
    System.out.printf("나이: %d\n", m1.age);
    System.out.printf("재직여부: %b\n", m1. working);
  }
}
