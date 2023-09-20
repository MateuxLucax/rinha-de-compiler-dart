sealed class Term {}

final class IntTerm implements Term {
  final int value;
  IntTerm(this.value);
}

final class StrTerm implements Term {
  final String value;
  StrTerm(this.value);
}

final class CallTerm implements Term {
  final String callee;
  final List<Term> arguments;
  CallTerm(this.callee, this.arguments);
}

final class BinaryOpTerm implements Term {
  final String op;
  final Term left;
  final Term right;
  BinaryOpTerm(this.op, this.left, this.right);
}

final class FunctionTerm implements Term {
  final List<String> parameters;
  final Term body;
  FunctionTerm(this.parameters, this.body);
}

final class LetTerm implements Term {
  final String name;
  final Term value;
  final Term next;
  LetTerm(this.name, this.value, this.next);
}

final class IfTerm implements Term {
  final Term condition;
  final Term thenBranch;
  final Term elseBranch;
  IfTerm(this.condition, this.thenBranch, this.elseBranch);
}

final class PrintTerm implements Term {
  final Term value;
  PrintTerm(this.value);
}

final class FirstTerm implements Term {
  final Term tuple;
  FirstTerm(this.tuple);
}

final class SecondTerm implements Term {
  final Term tuple;
  SecondTerm(this.tuple);
}

final class BoolTerm implements Term {
  final bool value;
  BoolTerm(this.value);
}

final class TupleTerm implements Term {
  final Term first;
  final Term second;
  TupleTerm(this.first, this.second);
}

final class VarTerm implements Term {
  final String name;
  VarTerm(this.name);
}
