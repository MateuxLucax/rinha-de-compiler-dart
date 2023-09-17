import '../expression.dart';

class BinaryExpression extends Expression {
  final Expression left;
  final Expression right;
  final String operator;

  BinaryExpression(this.left, this.right, this.operator);

  factory BinaryExpression.parse(Map<String, dynamic> value) {
    if (value['kind'] != 'Binary') throw Exception("Unknown expression: ${value['kind']}");

    final lhsExpression = value['lhs']['kind'];
    final Expression Function(Map<String, dynamic>)? lhsFunction = Expression.expressions[lhsExpression];
    if (lhsFunction == null) throw Exception("Unknown expression: $lhsExpression");

    final rhsExpression = value['rhs']['kind'];
    final Expression Function(Map<String, dynamic>)? rhsFunction = Expression.expressions[rhsExpression];
    if (rhsFunction == null) throw Exception("Unknown expression: $rhsExpression");

    final String? operator = value['op'];
    if (operator == null) throw Exception("Unknown operator: $operator");

    final Expression lhs = lhsFunction(value['lhs']);
    final Expression rhs = rhsFunction(value['rhs']);

    return BinaryExpression(rhs, lhs, operator);
  }

  @override
  String toString() {
    return 'BinaryExpression{left: $left, right: $right, operator: $operator}';
  }

  @override
  call() {
    return switch (operator) {
      'Add' => left() + right(),
      'Sub' => left() - right(),
      'Mul' => left() * right(),
      'Div' => left() / right(),
      'Rem' => left() % right(),
      'Eq' => left() == right(),
      'Neq' => left() != right(),
      'Lt' => left() < right(),
      'Lte' => left() <= right(),
      'Gt' => left() > right(),
      'Gte' => left() >= right(),
      'And' => left() && right(),
      'Or' => left() || right(),
      _ => throw Exception("Unknown operator: $operator"),
    };
  }
}
