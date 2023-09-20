import 'package:rinha_de_compiler_dart/tree_interpretor.dart';
import 'package:test/test.dart';

import 'file_util.dart';

// TODO: find a way to test the result. Maybe check print via some kind of mock I dunno
void main() {
  void baseTest(Map<String, dynamic> ast) {
    final Stopwatch stopwatch = Stopwatch()..start();

    final TreeInterpreter interpreter = TreeInterpreter(ast: ast);
    interpreter();

    stopwatch.stop();
    print('Elapsed time: ${stopwatch.elapsed}');
  }

  test('Should successfully interpret sum.rinha', () => baseTest(Resources.sum.asJson));

  test('Should successfully interpret fib.rinha', () => baseTest(Resources.fib.asJson));

  test('Should successfully interpret print.rinha', () => baseTest(Resources.print.asJson));

  test('Should successfully interpret compostos.rinha', () => baseTest(Resources.compostos.asJson));

  test('Should successfully interpret combination.rinha', () => baseTest(Resources.combination.asJson));

  test('Should successfully interpret tuple.rinha', () => baseTest(Resources.tuple.asJson));
}
