import 'package:flutter_test/flutter_test.dart';

Future<void> main() async {
  group('algorithm test', () {
    String input = '1   0   1  1 1';
    test('Mini-Max Sum', () {
      process(input);
    });
  });
}

void process(String input) {
  var inputs = input.split(' ');
  removeSpace(inputs);
  if (!checkInputInvalid(inputs)) {
    print('Must be integer character!');
    return;
  }
  if (inputs.length != 5) {
    print('Must be five character!');
    return;
  }
  var inputParsed = parseInput(inputs);
  if (!checkPositiveInt(inputParsed)) {
    print('Must be positive integer!');
    return;
  }
  inputParsed.sort();
  print(minMaxSum(inputParsed));
}

String minMaxSum(List<int> input) {
  int min = 0, max = 0;
  input.asMap().forEach((index, value) {
    if (index != 0) max += value;
    if (index != input.length - 1) min += value;
  });
  return '$min $max';
}

bool checkPositiveInt(List<int> input) {
  for (int element in input) {
    if (element <= 0) return false;
  }
  return true;
}

bool isNumeric(String s) {
  return int.tryParse(s) != null;
}

bool checkInputInvalid(List<String> inputs) {
  for (var element in inputs) {
    if (!isNumeric(element)) return false;
  }
  return true;
}

List<int> parseInput(List<String> inputs) {
  List<int> results = [];
  for (var element in inputs) {
    results.add(int.parse(element));
  }
  return results;
}

void removeSpace(List<String> inputs) {
  inputs.removeWhere((e) => e == '');
}
