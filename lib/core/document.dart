class Document {
  String name;
  String path;

  Document(this.name, this.path);
}

abstract class DocumentLoaderInterface {
  void loadDocument(Document document);
}
