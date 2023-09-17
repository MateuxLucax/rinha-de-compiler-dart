import '../base_term.dart';

class BinaryTerm extends BaseTerm {
  final BaseTerm left;
  final BaseTerm right;
  final String operator;

  BinaryTerm(this.left, this.right, this.operator);

  factory BinaryTerm.parse(Map<String, dynamic> ast) {
    if (ast['kind'] != 'Binary') throw Exception("Unknown expression: ${ast['kind']}");

    final lhsExpression = ast['lhs']['kind'];
    final BaseTerm Function(Map<String, dynamic>)? lhsFunction = BaseTerm.terms[lhsExpression];
    if (lhsFunction == null) throw Exception("Unknown expression: $lhsExpression");

    final rhsExpression = ast['rhs']['kind'];
    final BaseTerm Function(Map<String, dynamic>)? rhsFunction = BaseTerm.terms[rhsExpression];
    if (rhsFunction == null) throw Exception("Unknown expression: $rhsExpression");

    final String? operator = ast['op'];
    if (operator == null) throw Exception("Unknown operator: $operator");

    final BaseTerm lhs = lhsFunction(ast['lhs']);
    final BaseTerm rhs = rhsFunction(ast['rhs']);

    return BinaryTerm(rhs, lhs, operator);
  }

  @override
  String toString() {
    return 'BinaryExpression{left: $left, right: $right, operator: $operator}';
  }

  @override
  dynamic call() {
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
