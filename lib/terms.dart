sealed class Term {}

class VarTerm extends Term {
  final String name;
  VarTerm(this.name);
}

class StrTerm extends Term {
  final String value;
  StrTerm(this.value);
}

class IntTerm extends Term {
  final int value;
  IntTerm(this.value);
}

class BinaryOpTerm extends Term {
  final String op;
  final Term left;
  final Term right;
  BinaryOpTerm(this.op, this.left, this.right);
}

class IfTerm extends Term {
  final Term condition;
  final Term thenBranch;
  final Term elseBranch;
  IfTerm(this.condition, this.thenBranch, this.elseBranch);
}

class FunctionTerm extends Term {
  final List<String> parameters;
  final Term body;
  FunctionTerm(this.parameters, this.body);
}

class CallTerm extends Term {
  final String callee;
  final List<Term> arguments;
  CallTerm(this.callee, this.arguments);
}

class PrintTerm extends Term {
  final Term value;
  PrintTerm(this.value);
}

class LetTerm extends Term {
  final String name;
  final Term value;
  final Term next;
  LetTerm(this.name, this.value, this.next);
}
