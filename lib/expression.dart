import 'expressions/binary_expression.dart';
import 'expressions/int_expression.dart';
import 'expressions/print_expression.dart';
import 'expressions/string_expression.dart';

abstract class Expression {
  static const Map<String, Expression Function(Map<String, dynamic>)> expressions = <String, Expression Function(Map<String, dynamic>)>{
    'Binary': BinaryExpression.parse,
    'Int': IntExpression.parse,
    'Print': PrintExpression.parse,
    'Str': StringExpression.parse
  };

  dynamic call();

  operator +(Expression other) => other + this;

  operator -(Expression other) => other - this;

  operator *(Expression other) => other * this;

  operator /(Expression other) => other / this;

  operator %(Expression other) => other % this;

  operator <(Expression other) => other < this;

  operator <=(Expression other) => other <= this;

  operator >(Expression other) => other > this;

  operator >=(Expression other) => other >= this;
}
