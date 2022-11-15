import 'package:buildtool/buildtool.dart';
import 'package:path/path.dart' as p;
import 'package:test/test.dart';
import 'dart:io';

void main() {
  final dartSDKLocation = Uri.parse(
      "https://storage.googleapis.com/dart-archive/channels/stable/release/2.18.4/sdk/dartsdk-linux-arm64-release.zip");
  final tempDir = Directory.systemTemp.createTempSync();
  late final File archive;
  late final Directory inflatedArchive;

  setUpAll((() async {
    archive = await downloadFile(dartSDKLocation, tempDir);
    inflatedArchive = extractArchive(archive);
  }));

  test('Can download the Dart SDK', () async {
    expect(await archive.exists(), true);
  });

  test('Can extract a zip file', () async {
    expect(await inflatedArchive.exists(), true);
  });

  test('Can locate the dart executable', () async {
    var dartExePath =
        File(p.join(inflatedArchive.path, 'dart-sdk', 'bin', 'dart'));
    expect(await dartExePath.exists(), true);
  });
}
