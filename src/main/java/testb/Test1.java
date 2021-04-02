package testb;

public class Test1 {
  public static void main(String[] args) {
    Member m = new Member();
    m.name = "홍길동";
    m.tel = "010";

    m.print();

    System.out.println("--------------------");

    Student s = new Student();
    s.name = "임꺽정";
    s.tel = "111";
    s.school = "a대학";
    s.major = "컴퓨터";
    s.print();
  }

}
