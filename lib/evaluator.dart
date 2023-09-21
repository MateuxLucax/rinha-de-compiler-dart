import 'terms.dart';

typedef Env = Map<String, dynamic>;

typedef Tuple = (dynamic, dynamic);

class Evaluator {
  dynamic call(final Term term, final Env environment) {
    return switch (term) {
      IntTerm() => term.value,
      StrTerm() => term.value,
      CallTerm() => evaluateCallTerm(term, environment),
      BinaryOpTerm() => evaluateBinaryOpTerm(term, environment),
      FunctionTerm() => evaluateFunctionTerm(term, environment),
      LetTerm() => evaluateLetTerm(term, environment),
      IfTerm() => evaluateIfTerm(term, environment),
      PrintTerm() => evaluatePrintTerm(term, environment),
      FirstTerm() => evaluateFirstTerm(term, environment),
      SecondTerm() => evaluateSecondTerm(term, environment),
      BoolTerm() => term.value,
      TupleTerm() => evaluateTupleTerm(term, environment),
      VarTerm() => environment[term.name],
    };
  }

  dynamic evaluateCallTerm(CallTerm term, Env environment) {
    final callee = this(VarTerm(term.callee), environment);
    if (callee is Function) {
      final args = term.arguments.map((arg) => this(arg, environment)).toList();
      return callee(args);
    }
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
        _ => false,
      };

  dynamic evaluateFunctionTerm(FunctionTerm term, Env environment) {
    return (List<dynamic> args) {
      final localEnv = Map<String, dynamic>.from(environment);
      for (int i = 0; i < args.length; i++) {
        localEnv[term.parameters[i]] = args[i];
      }
      return this(term.body, localEnv);
    };
  }

  dynamic evaluateLetTerm(LetTerm term, Env environment) {
    final localEnv = Map<String, dynamic>.from(environment);
    final name = term.name;
    final value = this(term.value, localEnv);
    localEnv[name] = value;
    return this(term.next, localEnv);
  }

  dynamic evaluateIfTerm(IfTerm term, Env environment) {
    final condition = this(term.condition, environment);
    if (condition is bool) {
      return condition ? this(term.thenBranch, environment) : this(term.elseBranch, environment);
    }
  }

  dynamic evaluatePrintTerm(PrintTerm term, Env environment) {
    final result = this(term.value, environment);
    print(result);
    return result;
  }

  dynamic evaluateFirstTerm(FirstTerm term, Env environment) {
    final tuple = this(term.tuple, environment);
    if (tuple is Tuple) {
      return tuple.$1;
    }
  }

  dynamic evaluateSecondTerm(SecondTerm term, Env environment) {
    final tuple = this(term.tuple, environment);
    if (tuple is Tuple) {
      return tuple.$2;
    }
  }

  dynamic evaluateTupleTerm(TupleTerm term, Env environment) {
    return (this(term.first, environment), this(term.second, environment));
  }
}
