import 'document.dart';

class Project {
  String name;
  var documents = <String, Document>{};

  Project(var projectMetaData) {
    _decodeMetaData(projectMetaData);
  }

  dynamic _decodeMetaData(var jsonData) {
    name = jsonData['name'];
    for(var documentMeta in jsonData['documents']) {
      var document = Document(documentMeta);
      documents[document.name] = document;
    }
  }
}
