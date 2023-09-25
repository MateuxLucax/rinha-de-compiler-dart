sealed class Term {}

final class IntTerm extends Term {
  IntTerm(this.value);

  final int value;

  num operator +(final other) {
    return value + other.value;
  }
}

final class StrTerm extends Term {
  StrTerm(this.value);

  final String value;
}

final class CallTerm extends Term {
  CallTerm(this.callee, this.arguments);

  final String callee;
  final List<Term> arguments;
}

final class BinaryOpTerm extends Term {
  BinaryOpTerm(this.op, this.left, this.right);

  final String op;
  final Term left;
  final Term right;
}

final class FunctionTerm extends Term {
  FunctionTerm(this.parameters, this.body);

  final List<String> parameters;
  final Term body;
}

final class LetTerm extends Term {
  LetTerm(this.name, this.value, this.next);

  final String name;
  final Term value;
  final Term next;
}

final class IfTerm extends Term {
  IfTerm(this.condition, this.thenBranch, this.elseBranch);

  final Term condition;
  final Term thenBranch;
  final Term elseBranch;
}

final class PrintTerm extends Term {
  PrintTerm(this.value);

  final Term value;
}

final class FirstTerm extends Term {
  FirstTerm(this.tuple);

  final Term tuple;
}

final class SecondTerm extends Term {
  SecondTerm(this.tuple);

  final Term tuple;
}

final class BoolTerm extends Term {
  BoolTerm(this.value);

  final bool value;
}

final class TupleTerm extends Term {
  TupleTerm(this.first, this.second);

  final Term first;
  final Term second;
}

final class VarTerm extends Term {
  VarTerm(this.name);

  final String name;
}
