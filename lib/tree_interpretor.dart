import 'evaluator.dart';
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
      'Int' => IntTerm(ast['value']),
      'Str' => StrTerm(ast['value']),
      'Call' => CallTerm(ast['callee']['text'], (ast['arguments'] as List).map((arg) => parseExpression(arg)).toList()),
      'Binary' => BinaryOpTerm(ast['op'], parseExpression(ast['lhs']), parseExpression(ast['rhs'])),
      'Function' => FunctionTerm((ast['parameters'] as List).map((p) => p['text'].toString()).toList(), parseExpression(ast['value'])),
      'Let' => LetTerm(ast['name']['text'], parseExpression(ast['value']), parseExpression(ast['next'])),
      'If' => IfTerm(parseExpression(ast['condition']), parseExpression(ast['then']), parseExpression(ast['otherwise'])),
      'Print' => PrintTerm(parseExpression(ast['value'])),
      'First' => FirstTerm(parseExpression(ast['value'])),
      'Second' => SecondTerm(parseExpression(ast['value'])),
      'Bool' => BoolTerm(ast['value']),
      'Tuple' => TupleTerm(parseExpression(ast['first']), parseExpression(ast['second'])),
      'Var' => VarTerm(ast['text']),
      _ => throw Exception('Parse Error - Unknown term kind: ${ast['kind']}'),
    };
  }
}
