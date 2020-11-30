import 'package:text_reqs_server/core/document.dart';
import 'package:text_reqs_server/core/project.dart';

class ProjectParser {
  Project project;

  ProjectParser(dynamic jsonData) {
    _decodeProjectJSONData(jsonData);
  }

  dynamic _decodeProjectJSONData(var jsonData) {
    _checkKeyExists(jsonData, 'project_name');
    var projectName = jsonData['project_name'];
    var projectDocuments = <Document>[];
    for (var documentMeta in jsonData['documents']) {
      _checkKeyExists(documentMeta, 'document_name');
      _checkKeyExists(documentMeta, 'document_path');
      var documentName = documentMeta['document_name'];
      var documentPath = documentMeta['document_path'];
      var document = Document(documentName, documentPath);
      projectDocuments.add(document);
    }
    project = Project(projectName, projectDocuments);
  }

  void _checkKeyExists(var json, String key) {
    json[key] ?? (throw ProjectParserFormatException(key));
  }
}

class ProjectParserFormatException implements FormatException {
  String missingKey;
  ProjectParserFormatException(this.missingKey);

  @override
  String get message => 'Missing required JSON key: ${missingKey}';

  @override
  int get offset => null;

  @override
  dynamic get source => null;
}
