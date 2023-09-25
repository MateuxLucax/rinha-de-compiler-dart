import 'package:dartify_rinha/tree_interpretor.dart';
import 'package:test/test.dart';

import 'file_util.dart';

void main() {
  void baseTest({
    required final Resources resource,
    required final expected,
  }) {
    final Stopwatch stopwatch = Stopwatch()..start();

    final TreeInterpreter interpreter = TreeInterpreter(ast: resource.asJson);
    expect(interpreter.call, prints('$expected\n'));

    stopwatch.stop();
    print('${resource.fileName} took ${stopwatch.elapsed} to interpret');
  }

  test(
    'Should successfully interpret sum.rinha',
    () => baseTest(
      resource: Resources.sum,
      expected: '15',
    ),
  );

  test(
    'Should successfully interpret fib.rinha',
    () => baseTest(
      resource: Resources.fib,
      expected: '55',
    ),
  );

  test(
    'Should successfully interpret print.rinha',
    () => baseTest(
      resource: Resources.print,
      expected: 'Hello world',
    ),
  );

  test(
    'Should successfully interpret compostos.rinha',
    () => baseTest(
      resource: Resources.compostos,
      expected: '1\n2',
    ),
  );

  test(
    'Should successfully interpret combination.rinha',
    () => baseTest(
      resource: Resources.combination,
      expected: '45',
    ),
  );

  test(
    'Should successfully interpret tuple.rinha',
    () => baseTest(
      resource: Resources.tuple,
      expected: '1\n2\n2',
    ),
  );

  test(
    'Should successfully interpret sumStr.rinha',
    () => baseTest(
      resource: Resources.sumStr,
      expected: '3',
    ),
  );

  test(
    'Should successfully interpret concatStr.rinha',
    () => baseTest(
      resource: Resources.concatStr,
      expected: '1 + 2 = 3',
    ),
  );
}
