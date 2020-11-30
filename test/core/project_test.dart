import 'package:test/test.dart';
import 'package:text_reqs_server/core/document.dart';
import 'package:text_reqs_server/core/project.dart';

void main() {
  test('Constructor Normal', () {
    var documents = [
      Document('document1', 'path1'),
      Document('document2', 'path2'),
      Document('document3', 'path3'),
    ];
    var proj = Project('project1', documents);
    expect(proj.name, 'project1');
    expect(proj.documentMap['document1'].name, 'document1');
    expect(proj.documentMap['document2'].name, 'document2');
    expect(proj.documentMap['document3'].name, 'document3');
    expect(proj.documentMap['document1'].path, 'path1');
    expect(proj.documentMap['document2'].path, 'path2');
    expect(proj.documentMap['document3'].path, 'path3');
  });

  test('Constructor Normal - 1000 Documents', () {
    var documents = <Document>[];
    for (var i = 0; i < 1000; i++) {
      var docString = 'document${i}';
      var pathString = 'path${i}';
      documents.add(Document(docString, pathString));
    }
    var proj = Project('projectName', documents);
    for (var i = 0; i < 1000; i++) {
      var docString = 'document${i}';
      var pathString = 'path${i}';
      expect(proj.documentMap[docString].name, docString);
      expect(proj.documentMap[docString].path, pathString);
    }
  });
  test('getDocumentNames Normal', () {
    var documents = [
      Document('document1', 'path1'),
      Document('document2', 'path2'),
      Document('document3', 'path3'),
    ];
    var documentNames = Project('project1', documents).getDocumentNames();
    expect(documentNames.length, 3);
    expect(documentNames.contains('document1'), true);
    expect(documentNames.contains('document2'), true);
    expect(documentNames.contains('document3'), true);
  });
  test('getDocumentNames Normal - 1000 Documents', () {
    var documents = <Document>[];
    for (var i = 0; i < 1000; i++) {
      var docString = 'document${i}';
      var pathString = 'path${i}';
      documents.add(Document(docString, pathString));
    }
    var documentNames = Project('project1', documents).getDocumentNames();
    expect(documentNames.length, 1000);
    for (var i = 0; i < 1000; i++) {
      var docString = 'document${i}';
      expect(documentNames.contains(docString), true);
    }
  });
}
