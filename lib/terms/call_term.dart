import '../base_term.dart';

class CallTerm extends BaseTerm {
  final BaseTerm callee;
  final List<BaseTerm> arguments;

  CallTerm(this.callee, this.arguments);

  factory CallTerm.parse(Map<String, dynamic> ast) {
    if (ast['kind'] != 'Call') throw Exception("Unknown expression: ${ast['kind']}");

    final String? calleeKey = ast['callee']['kind'];
    final BaseTerm Function(Map<String, dynamic>)? calleeExpression = BaseTerm.terms[calleeKey];
    if (calleeExpression == null) throw Exception("Unknown expression: $calleeExpression");

    final List<BaseTerm> arguments = [];
    for (final argument in ast['arguments']) {
      final String? argumentKey = argument['kind'];
      final BaseTerm Function(Map<String, dynamic>)? argumentExpression = BaseTerm.terms[argumentKey];
      if (argumentExpression == null) throw Exception("Unknown expression: $argumentExpression");

      arguments.add(argumentExpression(argument));
    }

    return CallTerm(calleeExpression(ast['callee']), arguments);
  }

  @override
  call() async {
    final arguments = [];

    for (final argument in this.arguments) {
      arguments.add(await argument());
    }

    print(callee.runtimeType);

    return callee()(arguments);
  }
}
