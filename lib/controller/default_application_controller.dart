import 'package:flutter/material.dart';
import 'package:flutter_mdi_demo/models/desktop_icons.dart';
import 'package:flutter_mdi_demo/widgets/apps/pdfx_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final defaultAppProvider = Provider((ref) => DefaultApplicactionController());

class DefaultApplicactionController {
  DefaultApplicactionController();
  Widget defaulApp(FileType filetype) {
    switch (filetype) {
      case FileType.PDF:
        return const PdfWidget();
      default:
        return Center(child: Text("No existe aplicacion prediefinida para: $filetype"));
    }
  }
}
