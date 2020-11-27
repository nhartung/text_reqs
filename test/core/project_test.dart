import 'package:test/test.dart';
import 'package:text_reqs_server/core/project.dart';

void main() {
  test('Constructor Normal', () {
    var projectMeta = {
      'name': 'Hello World Project',
      'documents': [
        {'name': 'Doc1', 'value': 'value1'},
        {'name': 'Doc2', 'value': 'value2'}
      ]
    };
    var p = Project(projectMeta);
    expect(p.name, 'Hello World Project');
    expect(p.documents['Doc1'].name, 'Doc1');
    expect(p.documents['Doc2'].name, 'Doc2');
  });
}
