import 'package:dartify_rinha/tree_interpretor.dart';
import 'package:test/test.dart';

import 'file_util.dart';

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
