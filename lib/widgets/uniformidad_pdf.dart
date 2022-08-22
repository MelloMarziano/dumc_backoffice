import 'package:pdf/pdf.dart';
import 'dart:io';
import 'package:pdf/widgets.dart';
import 'package:path_provider/path_provider.dart';

reportView(context) async {
  final Document pdf = Document();

  pdf.addPage(
    MultiPage(
      pageFormat:
          PdfPageFormat.letter.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
      crossAxisAlignment: CrossAxisAlignment.start,
      build: (Context context) => <Widget>[],
    ),
  );
  //save PDF
}
