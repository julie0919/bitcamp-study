package testb.util;

public class Calculator {
  protected int result; // private 없애서 (default) 같은 패키지의 클래스가 값을 사용할 수 있게 한다.
  // protected: 다른 패키지라도 이 클래스를 상속받는 클래스(sub class)는 접근 가능하게하자.
  public void plus(int value) {
    this.result += value;
  }

  public int getResult() {
    return this.result;
  }

}
