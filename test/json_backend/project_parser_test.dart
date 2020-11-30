import 'package:test/test.dart';
import 'package:text_reqs_server/json_backend/project_parser.dart';

void main() {
  test('Constructor Normal', () {
    var jsonData = {
      'project_name': 'test_project',
      'documents': [
        {
          'document_name': 'test_document_1',
          'document_path': 'path/to/document_1'
        },
        {
          'document_name': 'test_document_2',
          'document_path': 'path/to/document_2'
        },
        {
          'document_name': 'test_document_3',
          'document_path': 'path/to/document_3'
        }
      ]
    };
    var parser = ProjectParser(jsonData);
    var project = parser.project;
    expect(project.name, 'test_project');
    expect(project.documentMap['test_document_1'].name, 'test_document_1');
    expect(project.documentMap['test_document_1'].path, 'path/to/document_1');
    expect(project.documentMap['test_document_2'].name, 'test_document_2');
    expect(project.documentMap['test_document_2'].path, 'path/to/document_2');
    expect(project.documentMap['test_document_3'].name, 'test_document_3');
    expect(project.documentMap['test_document_3'].path, 'path/to/document_3');
  });

  test('Constructor Invalid JSON', () {
    var jsonData1 = {
      'projekt_name': 'test_project',
      'documents': [
        {
          'document_name': 'test_document_1',
          'document_path': 'path/to/document_1'
        },
      ]
    };
    var jsonData2 = {
      'project_name': 'test_project',
      'documents': [
        {
          'document_nam': 'test_document_1',
          'document_path': 'path/to/document_1'
        },
      ]
    };
    var jsonData3 = {
      'project_name': 'test_project',
      'documents': [
        {
          'document_name': 'test_document_1',
          'document_pathh': 'path/to/document_1'
        },
      ]
    };
    expect(
        () => ProjectParser(jsonData1),
        throwsA(predicate((e) =>
            e is ProjectParserFormatException &&
            e.message == 'Missing required JSON key: project_name')));
    expect(
        () => ProjectParser(jsonData2),
        throwsA(predicate((e) =>
            e is ProjectParserFormatException &&
            e.message == 'Missing required JSON key: document_name')));
    expect(
        () => ProjectParser(jsonData3),
        throwsA(predicate((e) =>
            e is ProjectParserFormatException &&
            e.message == 'Missing required JSON key: document_path')));
  });
}
