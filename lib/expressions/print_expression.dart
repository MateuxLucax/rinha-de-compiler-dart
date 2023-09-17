import '../expression.dart';

class PrintExpression extends Expression {
  final Expression value;

  PrintExpression(this.value);

  @override
  factory PrintExpression.parse(Map<String, dynamic> value) {
    if (value['kind'] != 'Print') throw Exception("Unknown expression: ${value['kind']}");

    final valueExpression = value['value']['kind'];
    final Expression Function(Map<String, dynamic>)? expression = Expression.expressions[valueExpression];
    if (expression == null) throw Exception("Unknown expression: $expression");

    return PrintExpression(expression(value['value']));
  }

  @override
  call() {
    print(value());
  }
}
