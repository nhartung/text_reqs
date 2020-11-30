import 'document.dart';

class Project {
  String name;
  Map<String, Document> documentMap = <String, Document>{};

  Project(this.name, List<Document> documents) {
    for (var document in documents) {
      documentMap[document.name] = document;
    }
  }

  List<String> getDocumentNames() {
    var retList = <String>[];
    for (var entry in documentMap.keys) {
      retList.add(entry);
    }
    return retList;
  }

  Document getDocument(String documentName) {
    documentMap[documentName] ??
        (throw ArgumentError('You must specify a valid document.'));
    return documentMap[documentName];
  }
}
