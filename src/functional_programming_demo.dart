import 'R.dart';

int sum(a, b) {
  return a + b;
}

var sumCurry = R.curry(sum, 2);
var sum4 = sumCurry(4);
var sum10 = sumCurry(10);
var sum11 = sumCurry(11);
main(List<String> args) {
  print(sum4(1));
  print(sum10(1));
  print(sum11(1));
  var mappedFunc = R.map((x) => (x*2));
  print(mappedFunc([1,2,3,4]));
  var evenOnly = R.filter((x) => x%2 == 0);
  print(evenOnly([1,2,3,4]));
}
