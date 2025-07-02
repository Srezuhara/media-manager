import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_filex/open_filex.dart';
import '../models/pdf.dart';

class PDFService {
  static Future<String?> downloadPDF(String url) async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final filename = 'PDF_${DateTime.now().millisecondsSinceEpoch}.pdf';
      final path = '${dir.path}/$filename';

      await Dio().download(url, path);
      return path;
    } catch (e) {
      return null;
    }
  }

  static Future<List<PDFFile>> getDownloadedPDFs() async {
    final dir = await getApplicationDocumentsDirectory();
    final files = Directory(dir.path).listSync();

    return files
        .where((f) => f.path.endsWith('.pdf'))
        .map((f) {
      final stat = File(f.path).statSync();
      return PDFFile(
        name: f.path.split('/').last,
        path: f.path,
        size: stat.size,
        modified: stat.modified,
      );
    })
        .toList();
  }

  static Future<void> deletePDFs(List<String> paths) async {
    for (final path in paths) {
      final file = File(path);
      if (await file.exists()) {
        await file.delete();
      }
    }
  }

  static void openPDF(String path) {
    OpenFilex.open(path);
  }
}
