import 'dart:convert';
import 'dart:io';

import 'package:rinha_de_compiler_dart/tree_interpretor.dart';
import 'package:test/test.dart';

void main() {
  test('Should exec simpleSum.rinha', () {
    final File file = File('test/resources/simpleSum.rinha.json');
    final String content = file.readAsStringSync();
    final Map<String, dynamic> astJson = jsonDecode(content);

    final TreeInterpreter interpreter = TreeInterpreter();
    interpreter(astJson['expression']);
  });

  test('Should exec helloWord.rinha', () {
    final File file = File('test/resources/helloWorld.rinha.json');
    final String content = file.readAsStringSync();
    final Map<String, dynamic> astJson = jsonDecode(content);

    final TreeInterpreter interpreter = TreeInterpreter();
    interpreter(astJson['expression']);
  });
}
