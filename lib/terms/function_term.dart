import 'package:rinha_de_compiler_dart/cache.dart';

import '../base_term.dart';

class FunctionTerm extends BaseTerm {
  final Function(List<BaseTerm>) function;
  final List<String> parameters = [];

  FunctionTerm(this.function);

  factory FunctionTerm.parse(Map<String, dynamic> ast) {
    final String? kind = ast['kind'];
    if (kind != 'Function') throw Exception("Unknown term: $kind");

    final BaseTerm Function(Map<String, dynamic>)? term = BaseTerm.terms[ast['value']['kind']];
    if (term == null) throw Exception("Unknown value term: ${ast['value']['kind']}");

    final List<String> parameters = [];
    for (final parameter in ast['parameters']) {
      final String? key = parameter['text'];
      if (key == null) throw Exception("Invalid parameter: $parameter");

      parameters.add(key);
    }

    return FunctionTerm((arguments) {
      for (var i = 0; i < parameters.length; i++) {
        final key = parameters[i];
        final BaseTerm value = arguments[i];
        Cache.set(key, value());
      }

      return term(ast['value'])();
    });
  }

  @override
  Function call() {
    return function;
  }
}
