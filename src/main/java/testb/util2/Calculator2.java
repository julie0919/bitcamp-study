package testb.util2;

import testb.util.Calculator;

public class Calculator2 extends Calculator {
  public void minus(int value) {
    this.result -= value;
  }

  public void minus(int value1, int value2) {
    this.result -= value1;
    this.result -= value2;
  }

}
