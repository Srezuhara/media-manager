class PDFFile {
  final String name;
  final String path;
  final int size; // in bytes
  final DateTime modified;

  PDFFile({
    required this.name,
    required this.path,
    required this.size,
    required this.modified,
  });
}
