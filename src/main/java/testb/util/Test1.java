package testb.util;

import util.Calculator;

public class Test1 {
  public static void main(String[] args) {
    Calculator c = new Calculator();
    c.plus(100);
    //c.result = 300;
    System.out.println(c.result);
  }

}
