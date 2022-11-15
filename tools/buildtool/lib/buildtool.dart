import 'package:archive/archive_io.dart';
import 'package:path/path.dart' as p;

import 'dart:io';

Future<File> downloadFile(
    final Uri url, final Directory outputDirectory) async {
  var output = File(p.join(outputDirectory.path, url.pathSegments.last));
  var client = HttpClient();
  try {
    HttpClientRequest request = await client.getUrl(url);
    HttpClientResponse response = await request.close();
    await response.pipe(output.openWrite());
  } finally {
    client.close();
  }
  return output;
}

Directory extractArchive(File archive) {
  final output = Directory(p.join(
    p.dirname(archive.path),
    p.basenameWithoutExtension(archive.path)
  ));
  extractFileToDisk(archive.path, output.path);
  return output;
}
