import 'expression.dart';

class TreeInterpreter {
  void call(final Map<String, dynamic> astJson) {
    final Expression Function(Map<String, dynamic>)? expression = Expression.expressions[astJson['kind']];
    if (expression == null) throw Exception("Unknown expression: ${astJson['kind']}");

    final Expression astExpression = expression(astJson);
    astExpression();
  }
}
