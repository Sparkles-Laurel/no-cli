import 'dart:io';
import 'package:args/args.dart';

void main(List<String> arguments) {
  final argParser = ArgParser()
    ..addFlag('help', abbr: 'h', negatable: false, help: 'Display this help and exit')
    ..addFlag('version', negatable: false, help: 'Output version information and exit');

  ArgResults argResults;

  try {
    argResults = argParser.parse(arguments);
  } catch (e) {
    stderr.writeln('Error parsing arguments: $e');
    exit(1);
  }

  if (argResults['help']) {
    print(argParser.usage);
    exit(0);
  }

  if (argResults['version']) {
    print('no version 1.0'); // You can specify the actual version number here.
    exit(0);
  }

  final outputString = argResults.rest.isEmpty ? 'n' : argResults.rest.join(' ');

  while (true) {
    stdout.writeln(outputString);
  }
}

