import 'dart:convert';
import 'dart:io';

import 'package:dartify_rinha/tree_interpretor.dart';

void main(List<String> arguments) {
  exitCode = 0;

  if (arguments.isEmpty) {
    print('Usage: rinha_2_dart <source>');
    exitCode = 2;
    return;
  }

  final File file = File(arguments.first);
  final String content = file.readAsStringSync();
  final Map<String, dynamic> astJson = jsonDecode(content);

  final TreeInterpreter interpreter = TreeInterpreter(ast: astJson);
  interpreter();
}
