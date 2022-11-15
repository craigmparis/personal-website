import 'package:buildtool/buildtool.dart';
import 'package:path/path.dart' as p;
import 'package:test/test.dart';
import 'dart:io';

void main() {
  late final Directory tempDir;

  setUpAll(() async {
    tempDir = await Directory.systemTemp.createTemp();
  });

  tearDownAll(() async {
    await tempDir.delete(recursive: true);
  });

  group('Dart SDK', (() {
    const dartVersion = "2.18.4";
    const zipFile = "dartsdk-linux-x64-release.zip";
    final dartSDKLocation = Uri.parse(
        "https://storage.googleapis.com/dart-archive/channels/stable/release/$dartVersion/sdk/$zipFile");
    late final File executable;

    setUpAll(() async {
      executable = await bootstrapExecutable(
          dartSDKLocation, tempDir, p.join('dart-sdk', 'bin', 'dart'));
    });

    test('Can bootstrap and run the dart executable', () async {
      var result = await Process.run(executable.path, ['--version']);
      expect(
        result.stdout.trim(),
        'Dart SDK version: 2.18.4 (stable) (Tue Nov 1 15:15:07 2022 +0000) on "linux_x64"',
        reason: result.stderr.toString(),
      );
    });

    test('Deletes the archive', () async {
      expect(await File(p.join(tempDir.path, zipFile)).exists(), false);
    });
  }));

  group('Nodejs', (() {
    const nodeJsVersion = "16.18.0";
    const xzFile = "node-v$nodeJsVersion-linux-x64.tar.xz";
    final nodeJsUrl =
        Uri.parse("https://nodejs.org/dist/v$nodeJsVersion/$xzFile");
    late final File executable;

    setUpAll(() async {
      executable =
          await bootstrapExecutable(nodeJsUrl, tempDir, p.join('bin', 'node'));
    });

    test('Can bootstrap and run the NodeJS executable', () async {
      var result = await Process.run(executable.path, ['--version']);
      expect(
        result.stdout.trim(),
        'Dart SDK version: 2.18.4 (stable) (Tue Nov 1 15:15:07 2022 +0000) on "linux_x64"',
        reason: result.stderr.toString(),
      );
    });

    test('Deletes the archive', () async {
      expect(await File(p.join(tempDir.path, xzFile)).exists(), false);
    });
  }));
}
