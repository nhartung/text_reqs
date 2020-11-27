class Document {
   String name;
   String value;

   Document(var documentMetaJson) {
     name = documentMetaJson['name'];
     value = documentMetaJson['value'];
   }
}
