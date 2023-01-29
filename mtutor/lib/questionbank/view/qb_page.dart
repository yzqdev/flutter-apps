import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;

import '../../constant/constant.dart';
import 'pdf_viewer.dart';

class QbPage extends StatefulWidget {
  const QbPage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const QbPage());
  }

  @override
  State<QbPage> createState() => _QbPageState();
}

class _QbPageState extends State<QbPage> {
  Future<File> loadPdfFromNetwork(String url) async {
    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;
    return _storeFile(url, bytes);
  }

  Future<File> _storeFile(String url, List<int> bytes) async {
    final filename = basename(url);
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes, flush: true);
    if (kDebugMode) {
      print('$file');
    }
    return file;
  }

  void openPdf(BuildContext context, File file, String url, String filename) =>
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PdfViewerPage(
            file: file,
            url: url,
            filename: filename,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primarycolor_light,
        appBar: AppBar(
          title: const Text('Question Bank'),
          backgroundColor: secondarycolor_light,
        ),
        body: SafeArea(
            child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) => Card(
            elevation: 6,
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.orangeAccent[200],
                child: Text("QB${index + 1}"),
              ),
              title: Text("QB ${index + 1} Title"),
              subtitle: Text("QB ${index + 1} Subtitle"),
              trailing: IconButton(
                icon: Icon(
                  Icons.download,
                  size: 20.0,
                  color: Colors.brown[900],
                ),
                onPressed: () async {
                  const url =
                      "http://www.africau.edu/images/default/sample.pdf";
                  final file = await loadPdfFromNetwork(url);
                  openPdf(context, file, url, "QB ${index + 1}");
                },
              ),
            ),
          ),
        )));
  }
}
