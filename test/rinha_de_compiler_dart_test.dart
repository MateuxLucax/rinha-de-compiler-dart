import 'package:rinha_de_compiler_dart/tree_interpretor.dart';
import 'package:test/test.dart';

import 'file_util.dart';

void main() {
  test('Should successfully interpret sum.rinha', () {
    final Stopwatch stopwatch = Stopwatch()..start();

    final Map<String, dynamic> ast = Resources.sum.asJson;
    final TreeInterpreter interpreter = TreeInterpreter(ast: ast);
    interpreter();
    stopwatch.stop();
    print('Elapsed time: ${stopwatch.elapsed}');
  });
  test('Should successfully interpret fib.rinha', () {
    final Stopwatch stopwatch = Stopwatch()..start();

    final Map<String, dynamic> ast = Resources.fib.asJson;
    final TreeInterpreter interpreter = TreeInterpreter(ast: ast);
    interpreter();

    stopwatch.stop();
    print('Elapsed time: ${stopwatch.elapsed}');
  });
  test('Should successfully interpret combination.rinha', () {
    final Stopwatch stopwatch = Stopwatch()..start();

    final Map<String, dynamic> ast = Resources.combination.asJson;
    final TreeInterpreter interpreter = TreeInterpreter(ast: ast);
    interpreter();

    stopwatch.stop();
    print('Elapsed time: ${stopwatch.elapsed}');
  });
  test('Should successfully interpret print.rinha', () {
    final Stopwatch stopwatch = Stopwatch()..start();

    final Map<String, dynamic> ast = Resources.print.asJson;
    final TreeInterpreter interpreter = TreeInterpreter(ast: ast);
    interpreter();

    stopwatch.stop();
    print('Elapsed time: ${stopwatch.elapsed}');
  });
}
