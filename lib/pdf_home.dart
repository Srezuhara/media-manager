import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'pdf_service.dart';
import '../models/pdf.dart';

class PDFHomePage extends StatefulWidget {
  @override
  _PDFHomePageState createState() => _PDFHomePageState();
}

class _PDFHomePageState extends State<PDFHomePage> {
  TextEditingController _urlController = TextEditingController();
  List<PDFFile> _pdfFiles = [];
  Set<String> _selectedPaths = {};
  bool _isDownloading = false;

  @override
  void initState() {
    super.initState();
    requestPermission();
    loadFiles();
  }

  Future<void> requestPermission() async {
    await Permission.storage.request();
  }

  Future<void> loadFiles() async {
    final files = await PDFService.getDownloadedPDFs();
    setState(() => _pdfFiles = files);
  }

  Future<void> download(String url) async {
    setState(() => _isDownloading = true);
    final path = await PDFService.downloadPDF(url);
    setState(() => _isDownloading = false);

    if (path != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Downloaded ${path.split('/').last}")));
      loadFiles();
    }
  }

  void toggleSelection(String path) {
    setState(() {
      if (_selectedPaths.contains(path)) {
        _selectedPaths.remove(path);
      } else {
        _selectedPaths.add(path);
      }
    });
  }

  Future<void> deleteSelected() async {
    await PDFService.deletePDFs(_selectedPaths.toList());
    setState(() => _selectedPaths.clear());
    loadFiles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Downloaded Reports"),
        actions: [
          if (_selectedPaths.isNotEmpty)
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: deleteSelected,
            )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _urlController,
              decoration: InputDecoration(
                labelText: "Enter PDF URL",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _isDownloading
                  ? null
                  : () => download(_urlController.text.trim()),
              child: Text(_isDownloading ? "Downloading..." : "Download PDF"),
            ),
            SizedBox(height: 20),
            Expanded(
              child: _pdfFiles.isEmpty
                  ? Center(child: Text("No PDFs yet"))
                  : ListView.builder(
                itemCount: _pdfFiles.length,
                itemBuilder: (context, index) {
                  final pdf = _pdfFiles[index];
                  final selected = _selectedPaths.contains(pdf.path);
                  return ListTile(
                    title: Text(pdf.name),
                    subtitle: Text(
                      "${(pdf.size / 1024).toStringAsFixed(2)} KB\n${pdf.modified}",
                    ),
                    isThreeLine: true,
                    leading: Checkbox(
                      value: selected,
                      onChanged: (_) => toggleSelection(pdf.path),
                    ),
                    onTap: () => PDFService.openPDF(pdf.path),
                    onLongPress: () => toggleSelection(pdf.path),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
