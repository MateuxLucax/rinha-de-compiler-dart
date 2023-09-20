import 'package:rinha_de_compiler_dart/terms.dart';

typedef Env = Map<String, dynamic>;

class Evaluator {
  dynamic call(final Term term, final Env environment) {
    return switch (term) {
      VarTerm() => environment[term.name],
      StrTerm() => term.value,
      IntTerm() => term.value,
      BinaryOpTerm() => evaluateBinaryOpTerm(term, environment),
      IfTerm() => evaluateIfTerm(term, environment),
      FunctionTerm() => evaluateFunctionTerm(term, environment),
      CallTerm() => evaluateCallTerm(term, environment),
      LetTerm() => evaluateLetTerm(term, environment),
      PrintTerm() => evaluatePrintTerm(term, environment),
    };
  }

  dynamic evaluateBinaryOpTerm(BinaryOpTerm term, Env environment) => switch (term.op) {
        'Add' => this(term.left, environment) + this(term.right, environment),
        'Sub' => this(term.left, environment) - this(term.right, environment),
        'Mul' => this(term.left, environment) * this(term.right, environment),
        'Div' => this(term.left, environment) / this(term.right, environment),
        'Rem' => this(term.left, environment) % this(term.right, environment),
        'Eq' => this(term.left, environment) == this(term.right, environment),
        'Neq' => this(term.left, environment) != this(term.right, environment),
        'Lt' => this(term.left, environment) < this(term.right, environment),
        'Lte' => this(term.left, environment) <= this(term.right, environment),
        'Gt' => this(term.left, environment) > this(term.right, environment),
        'Gte' => this(term.left, environment) >= this(term.right, environment),
        'And' => this(term.left, environment) && this(term.right, environment),
        'Or' => this(term.left, environment) || this(term.right, environment),
        _ => throw Exception('Evaluate Error - Unknown binary operator: ${term.op}'),
      };

  dynamic evaluateIfTerm(IfTerm term, Env environment) {
    final condition = this(term.condition, environment);
    if (condition is bool) {
      return condition ? this(term.thenBranch, environment) : this(term.elseBranch, environment);
    } else {
      throw Exception('Evaluate Error - [If] condition must be a boolean');
    }
  }

  dynamic evaluateFunctionTerm(FunctionTerm term, Env environment) {
    return (List<dynamic> args) {
      final localEnv = Map<String, dynamic>.from(environment);
      for (int i = 0; i < args.length; i++) {
        localEnv[term.parameters[i]] = args[i];
      }
      return this(term.body, localEnv);
    };
  }

  dynamic evaluateCallTerm(CallTerm term, Env environment) {
    final callee = this(VarTerm(term.callee), environment);
    if (callee is Function) {
      final args = term.arguments.map((arg) => this(arg, environment)).toList();
      return callee(args);
    } else {
      throw Exception('Evaluate Error - Trying to call a non-function');
    }
  }

  dynamic evaluateLetTerm(LetTerm term, Env environment) {
    final localEnv = Map<String, dynamic>.from(environment);
    final name = term.name;
    final value = this(term.value, localEnv);
    localEnv[name] = value;
    return this(term.next, localEnv);
  }

  dynamic evaluatePrintTerm(PrintTerm term, Env environment) {
    final result = this(term.value, environment);
    print(result);
    return result;
  }
}
