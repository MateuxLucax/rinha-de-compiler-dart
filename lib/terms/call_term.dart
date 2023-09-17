import '../base_term.dart';
import 'function_term.dart';

class CallTerm extends BaseTerm {
  final BaseTerm callee;
  final List<BaseTerm> arguments;

  CallTerm(this.callee, this.arguments);

  factory CallTerm.parse(Map<String, dynamic> ast) {
    if (ast['kind'] != 'Call') throw Exception("Unknown term: ${ast['kind']}");

    final String? calleeKey = ast['callee']['kind'];
    final BaseTerm Function(Map<String, dynamic>)? calleeTerm = BaseTerm.terms[calleeKey];
    if (calleeTerm == null) throw Exception("Unknown term: $calleeTerm");

    final List<BaseTerm> arguments = [];
    for (final argument in ast['arguments']) {
      final String? argumentKey = argument['kind'];
      final BaseTerm Function(Map<String, dynamic>)? argumentTerm = BaseTerm.terms[argumentKey];
      if (argumentTerm == null) throw Exception("Unknown term: $argumentTerm");

      arguments.add(argumentTerm(argument));
    }

    return CallTerm(calleeTerm(ast['callee']), arguments);
  }

  @override
  call() {
    final function = callee();

    if (function is! FunctionTerm) throw Exception("Invalid function: $function");

    return function()(arguments);
  }
}
