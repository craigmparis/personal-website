import 'package:archive/archive_io.dart';
import 'package:path/path.dart' as p;
import 'package:posix/posix.dart';

import 'dart:async';
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

Future<Directory> extractArchive(File archiveFile) async {
  final output = Directory(p.join(p.dirname(archiveFile.path),
      p.basenameWithoutExtension(archiveFile.path)));
  final inputStream = InputFileStream(archiveFile.path);
  if (archiveFile.path.endsWith('.zip')) {
    final archive = ZipDecoder().decodeBuffer(inputStream);
    await _writeFileTree(archive, output);
  } else if (archiveFile.path.endsWith('.tar.xz')) {
    final bytes = XZDecoder().decodeBuffer(inputStream);
    final archive = TarDecoder().decodeBytes(bytes);
    await _writeFileTree(archive, output);
  } else {
    throw Exception('Unrecognized decoder');
  }
  await archiveFile.delete();
  return output;
}

Future _writeFileTree(Archive archive, Directory output) async {
  final futures = <Future<File>>[];
  for (final file in archive) {
    if (file.isFile) {
      var fileReference = File(p.join(output.path, file.name));
      fileReference.createSync(recursive: true);
      futures.add(fileReference.writeAsBytes(file.content as List<int>));
    }
  }
  await Future.wait(futures);
}

void markFileAsExecutable(File file) {
  if (Platform.isLinux || Platform.isMacOS) {
    chmod(file.path, '777');
  }
}

Future<File> bootstrapExecutable(
  final Uri archiveUrl,
  final Directory outputDirectory,
  final String relativePathToExecutable,
) async {
  File downloadedArchive = await downloadFile(archiveUrl, outputDirectory);
  Directory extractedArchiveRoot = await extractArchive(downloadedArchive);
  File executable =
      File(p.join(extractedArchiveRoot.path, relativePathToExecutable));
  markFileAsExecutable(executable);
  return executable;
}
