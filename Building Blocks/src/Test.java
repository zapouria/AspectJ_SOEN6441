

public class Test {
  public static void main(String[] args) {
    BStack myStack = new BStack(3);
    myStack.push("base");
    myStack.push("your");
    myStack.push("all");
    System.out.println(myStack.pop());
    System.out.println(myStack.pop());
    System.out.println(myStack.pop());
  }
}

