import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdfx/pdfx.dart';

class PdfWidget extends ConsumerStatefulWidget {
  const PdfWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PdfWidgetState();
}

class _PdfWidgetState extends ConsumerState<PdfWidget> {
  final pdfPinchController = PdfControllerPinch(
    document: PdfDocument.openAsset('assets/docs/pdf-sample.pdf'),
  );

// Pdf view with re-render pdf texture on zoom (not loose quality on zoom)
// Not supported on windows

  @override
  Widget build(BuildContext context) {
    return PdfViewPinch(
      controller: pdfPinchController,
    );
  }
}
