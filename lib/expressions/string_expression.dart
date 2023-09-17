import '../expression.dart';

class StringExpression extends Expression {
  final String value;

  StringExpression(this.value);

  factory StringExpression.parse(Map<String, dynamic> value) {
    if (value['kind'] != 'Str') throw Exception("Unknown expression: ${value['kind']}");

    return StringExpression(value['value']);
  }

  @override
  String call() {
    return value;
  }
}
