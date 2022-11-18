import static org.junit.Assert.*;
import org.junit.*;
import java.util.ArrayList;
import java.util.List;
import java.util.*;

class SomeStringChecker implements StringChecker {

  @Override
  public boolean checkString(String s) {
    if (s.indexOf('a') == 0 || s.indexOf('e') == 0 || s.indexOf('i') == 0 || s.indexOf('o') == 0
        || s.indexOf('u') == 0)
      return true;
    return false;
  }

}

public class TestListExamples {
  // Write your grading tests here!
  @Test
  public void testFilter() {
    List<String> input = Arrays.asList("apple", "or");
    List<String> output = Arrays.asList("apple", "or");
    SomeStringChecker stringChecker = new SomeStringChecker();
    assertEquals(output, ListExamples.filter(input,
        stringChecker));
  }

  @Test
  public void testFilter2() {
    List<String> input = Arrays.asList();
    List<String> output = Arrays.asList();
    SomeStringChecker stringChecker = new SomeStringChecker();
    assertEquals(output,
        ListExamples.filter(input, stringChecker));
  }

  @Test
  public void testFilter3() {
    List<String> input = Arrays.asList("banana");
    List<String> output = Arrays.asList();
    SomeStringChecker stringChecker = new SomeStringChecker();
    assertEquals(output, ListExamples.filter(input,
        stringChecker));
  }

  @Test
  public void testMerge3() {
    List<String> list1 = Arrays.asList("apple", "banana", "cat");
    List<String> list2 = Arrays.asList("banana");
    List<String> output = Arrays.asList("apple", "banana", "banana", "cat");
    assertEquals(output, ListExamples.merge(list1, list2));
  }
}