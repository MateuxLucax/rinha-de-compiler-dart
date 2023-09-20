import 'package:rinha_de_compiler_dart/evaluator.dart';

import 'terms.dart';

typedef Ast = Map<String, dynamic>;

class TreeInterpreter {
  TreeInterpreter({required this.ast});

  Ast ast;

  void call() {
    final root = ast['expression'];
    final rootTerm = parseExpression(root);
    final Evaluator evaluator = Evaluator();
    evaluator(rootTerm, {});
  }

  Term parseExpression(final Ast ast) {
    return switch (ast['kind']) {
      'Var' => VarTerm(ast['text']),
      'Str' => StrTerm(ast['value']),
      'Int' => IntTerm(ast['value']),
      'Print' => PrintTerm(parseExpression(ast['value'])),
      'Let' => LetTerm(ast['name']['text'], parseExpression(ast['value']), parseExpression(ast['next'])),
      'Binary' => BinaryOpTerm(ast['op'], parseExpression(ast['lhs']), parseExpression(ast['rhs'])),
      'If' => IfTerm(parseExpression(ast['condition']), parseExpression(ast['then']), parseExpression(ast['otherwise'])),
      'Function' => FunctionTerm((ast['parameters'] as List).map((p) => p['text'].toString()).toList(), parseExpression(ast['value'])),
      'Call' => CallTerm(ast['callee']['text'], (ast['arguments'] as List).map((arg) => parseExpression(arg)).toList()),
      _ => throw Exception('Parse Error - Unknown term kind: ${ast['kind']}'),
    };
  }
}
