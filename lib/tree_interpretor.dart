import 'base_term.dart';
import 'cache.dart';

class TreeInterpreter {
  void call(final Map<String, dynamic> astJson) async {
    final BaseTerm Function(Map<String, dynamic>)? expression = BaseTerm.terms[astJson['kind']];
    if (expression == null) throw Exception("Unknown expression: ${astJson['kind']}");

    final BaseTerm astExpression = expression(astJson);
    astExpression();

    while (Cache.isNotEmpty) {
      final BaseTerm term = Cache.pop();
      await term();
    }
  }
}
