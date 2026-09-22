import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';

LazyDatabase openDatabaseConnection({
  required String databaseName,
}) {
  return LazyDatabase(() async {
    final directory =
    await getApplicationDocumentsDirectory();

    final file = File(
      '${directory.path}/$databaseName.sqlite',
    );

    return NativeDatabase.createInBackground(file);
  });
}