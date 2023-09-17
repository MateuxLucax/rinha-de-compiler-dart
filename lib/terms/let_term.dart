import 'package:rinha_de_compiler_dart/cache.dart';

import '../base_term.dart';

class LetTerm extends BaseTerm {
  final String name;
  final BaseTerm value;
  final BaseTerm next;

  LetTerm(this.name, this.value, this.next);

  factory LetTerm.parse(Map<String, dynamic> ast) {
    if (ast['kind'] != 'Let') throw Exception("Unknown expression: ${ast['kind']}");

    final String? name = ast['name']['text'];
    if (name == null) throw Exception("Invalid let expression: $ast");

    final LetTerm? cached = Cache.variables[name];
    if (cached != null) {
      return cached;
    }

    final valueExpressionKey = ast['value']['kind'];
    final BaseTerm Function(Map<String, dynamic>)? valueExpression = BaseTerm.terms[valueExpressionKey];
    if (valueExpression == null) throw Exception("Unknown expression: $valueExpression");

    final nextExpressionKey = ast['next']['kind'];
    final BaseTerm Function(Map<String, dynamic>)? nextExpression = BaseTerm.terms[nextExpressionKey];
    if (nextExpression == null) throw Exception("Unknown expression: $nextExpression");

    final LetTerm letTerm = LetTerm(name, valueExpression(ast['value']), nextExpression(ast['next']));
    Cache.variables[name] = letTerm;

    return letTerm;
  }

  @override
  dynamic call() async {
    Cache.push(next);
    return value();
  }
}
