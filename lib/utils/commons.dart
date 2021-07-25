import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

import 'package:eglimpia/components/cities_dialog.dart';
import 'package:eglimpia/components/actions_dialog.dart';

Future<int?> showActionsDialog(BuildContext context) {
  return showDialog<int>(
    context: context,
    barrierDismissible: true,
    builder: (context) => ActionsDialog(),
  );
}

Future<String?> showCitiesDialog(BuildContext context, String? currentCity) {
  return showDialog<String>(
    context: context,
    barrierDismissible: true,
    builder: (context) => CitiesDialog(selectedCode: currentCity),
  );
}

Future<File> getImageFileFromAssets(String? path) async {
  final byteData = await rootBundle.load('images/$path');

  final file = File('${(await getTemporaryDirectory()).path}/$path');
  await file.writeAsBytes(byteData.buffer
      .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

  return file;
}

void showSuccessMessage(BuildContext context, String message) {
  Flushbar(
    flushbarPosition: FlushbarPosition.TOP,
    flushbarStyle: FlushbarStyle.GROUNDED,
    animationDuration: Duration(seconds: 1),
    backgroundColor: Colors.green,
    message: message,
    duration: Duration(seconds: 5),
    isDismissible: true,
  )..show(context);
}

void showErrorMessage(BuildContext context, String message) {
  Flushbar(
    flushbarPosition: FlushbarPosition.TOP,
    flushbarStyle: FlushbarStyle.GROUNDED,
    animationDuration: Duration(seconds: 1),
    backgroundColor: Colors.red,
    message: message,
    duration: Duration(seconds: 5),
    isDismissible: true,
  )..show(context);
}
