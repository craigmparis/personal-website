import 'package:path/path.dart' as p;

import 'dart:io';

Future<File> downloadFile(final Uri url, final Directory outputDirectory) async {
  var output = File(p.join(outputDirectory.path, url.pathSegments.last));
  var client = HttpClient();
  try {
    HttpClientRequest request = await client.getUrl(url);
    HttpClientResponse response = await request.close();
    response.pipe(output.openWrite());
  } finally {
    client.close();
  }
  return output;
}
