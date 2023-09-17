import 'package:rinha_de_compiler_dart/tree_interpretor.dart';
import 'package:test/test.dart';

import 'file_util.dart';

void main() {
  test('Should exec sum.rinha', () {
    final sumJson = Resources.sum.asJson;
    final TreeInterpreter interpreter = TreeInterpreter();
    interpreter(sumJson['expression']);
  });

  test('Should exec fib.rinha', () {
    final sumJson = Resources.fib.asJson;
    final TreeInterpreter interpreter = TreeInterpreter();
    interpreter(sumJson['expression']);
  });

  test('Should exec print.rinha', () {
    final sumJson = Resources.print.asJson;
    final TreeInterpreter interpreter = TreeInterpreter();
    interpreter(sumJson['expression']);
  });

  test('Should exec combination.rinha', () {
    final sumJson = Resources.combination.asJson;
    final TreeInterpreter interpreter = TreeInterpreter();
    interpreter(sumJson['expression']);
  });
}
