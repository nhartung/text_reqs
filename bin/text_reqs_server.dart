import 'dart:convert';
import 'dart:io';

import 'package:text_reqs_server/core/project.dart' as test;

void main(List<String> arguments) {
  var projectFile = File('test.json');
  var projectJsonData = jsonDecode(projectFile.readAsStringSync());
  test.Project(projectJsonData);
  print('Done.');
}
