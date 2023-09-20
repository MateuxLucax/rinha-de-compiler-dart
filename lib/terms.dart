sealed class Term {}

final class IntTerm implements Term {
  IntTerm(this.value);

  final int value;
}

final class StrTerm implements Term {
  StrTerm(this.value);

  final String value;
}

final class CallTerm implements Term {
  CallTerm(this.callee, this.arguments);

  final String callee;
  final List<Term> arguments;
}

final class BinaryOpTerm implements Term {
  BinaryOpTerm(this.op, this.left, this.right);

  final String op;
  final Term left;
  final Term right;
}

final class FunctionTerm implements Term {
  FunctionTerm(this.parameters, this.body);

  final List<String> parameters;
  final Term body;
}

final class LetTerm implements Term {
  LetTerm(this.name, this.value, this.next);

  final String name;
  final Term value;
  final Term next;
}

final class IfTerm implements Term {
  IfTerm(this.condition, this.thenBranch, this.elseBranch);

  final Term condition;
  final Term thenBranch;
  final Term elseBranch;
}

final class PrintTerm implements Term {
  PrintTerm(this.value);

  final Term value;
}

final class FirstTerm implements Term {
  FirstTerm(this.tuple);

  final Term tuple;
}

final class SecondTerm implements Term {
  SecondTerm(this.tuple);

  final Term tuple;
}

final class BoolTerm implements Term {
  BoolTerm(this.value);

  final bool value;
}

final class TupleTerm implements Term {
  TupleTerm(this.first, this.second);

  final Term first;
  final Term second;
}

final class VarTerm implements Term {
  VarTerm(this.name);

  final String name;
}
