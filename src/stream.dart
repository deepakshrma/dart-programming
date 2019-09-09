import 'dart:async';
Future<int> sumNumber(Stream<int> stream) async {
  var sum = 0;
  await for (var i in stream) {
    sum += i;
  }
  return sum;
}
class IntegerStream {
  static Stream<int> of(int count) async* {
    for (var i = 1; i <= count; i++) {
      yield i;
    }
  }
}
main (List<String> args) async {
  var streamOf10 = IntegerStream.of(3);
  var sum = await sumNumber(streamOf10);
  print("sum of numbers: $sum");
}