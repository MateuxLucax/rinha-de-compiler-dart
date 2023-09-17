import '../expression.dart';

class IntExpression extends Expression {
  final int value;

  IntExpression(this.value);

  factory IntExpression.parse(Map<String, dynamic> value) {
    if (value['kind'] != 'Int') throw Exception("Unknown expression: ${value['kind']}");

    return IntExpression(value['value']);
  }

  @override
  int call() {
    return value;
  }
}
