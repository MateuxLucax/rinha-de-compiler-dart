import '../base_term.dart';

class PrintTerm extends BaseTerm {
  final BaseTerm value;

  PrintTerm(this.value);

  @override
  factory PrintTerm.parse(Map<String, dynamic> ast) {
    if (ast['kind'] != 'Print') throw Exception("Unknown expression: ${ast['kind']}");

    final valueExpression = ast['value']['kind'];
    final BaseTerm Function(Map<String, dynamic>)? expression = BaseTerm.terms[valueExpression];
    if (expression == null) throw Exception("Unknown expression: $expression");

    return PrintTerm(expression(ast['value']));
  }

  @override
  dynamic call() async {
    print(await value());
  }
}
