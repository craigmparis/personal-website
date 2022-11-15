import 'package:buildtool/buildtool.dart';
import 'package:test/test.dart';
import 'dart:io';

void main() {
  test('Can download the Dart SDK', () async {
    // Given a url and an output path
    final dartSDKLocation = Uri.parse("https://storage.googleapis.com/dart-archive/channels/stable/release/2.18.4/sdk/dartsdk-linux-arm64-release.zip");
    final tempDir = Directory.systemTemp.createTempSync();

    // When downloadArchive is called
    final File archive = await downloadFile(dartSDKLocation, tempDir);

    // Then the archive is downloaded successfully
    expect(await archive.exists(), true);
  });
}
