import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hebauto/core/util/ext/context.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:universal_html/html.dart';

import '../../injection.dart';
import '../network/api/dio_client.dart';
import '../network/api/list_api.dart';

class DxPdfViewer extends StatefulWidget {
  const DxPdfViewer({super.key, required this.url, required this.vin});

  final String url;
  final String vin;

  @override
  State<DxPdfViewer> createState() => _DxPdfViewerState();
}

class _DxPdfViewerState extends State<DxPdfViewer> {
  final PdfViewerController _pdfViewerController = PdfViewerController();

  Uint8List? pdfBytes;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        width: context.width() / 2,
        // height: context.height(),
        child: widget.url.contains('http')
            ? FutureBuilder(
                future: getIt<DioClient>().dio.post<String>(ListAPI.loadPdf,
                    data: {'pdfUrl': widget.url}),
                builder: (ctx, stx) {
                  if (stx.connectionState == ConnectionState.waiting) {
                    return const SizedBox(
                        height: 200,
                        width: 200,
                        child: Center(child: CircularProgressIndicator()));
                  }
                  if (stx.connectionState == ConnectionState.done) {
                    if (stx.hasData) {
                      final response = stx.data;
                      Uint8List fileBytes = base64Decode(response?.data ?? '');

                      pdfBytes = fileBytes;

                      return SfPdfViewer.memory(
                        controller: _pdfViewerController,
                        initialZoomLevel: 0,
                        fileBytes,
                        onDocumentLoaded: (details) {
                          //_pdfViewerController.zoomLevel = PdfViewerZoomMode.fitWidth;
                        },
                        onDocumentLoadFailed: (cause) {
                          debugPrint('${cause.description} ${widget.url} ');
                        },
                      );
                    }
                  }
                  return const SizedBox(
                      height: 200,
                      child: Center(
                          child:
                              Text('Something went wrong! Contact Support.')));
                })
            : const SizedBox(
                height: 200, child: Center(child: Text('Invalid url!'))),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
       widget.vin.isNotEmpty? TextButton(
          onPressed: () async {
            if(pdfBytes != null){
              AnchorElement(
                  href:
                  'data:application/pdf;base64,${base64Encode(pdfBytes as List<int>)}')
                ..setAttribute('download', '${widget.vin}_INVOICE.pdf')
                ..click();
            }

          },
          child: const Text('Download'),
        ): const SizedBox.shrink(),
      ],
    );
  }
}

//PdfViewer.openFuture(() => null, (p0) => null)
// PdfViewer.openFutureFile(
//   // Accepting function that returns Future<String> of PDF file path
//       () async => (await DefaultCacheManager().getSingleFile(
//       'https://github.com/espresso3389/flutter_pdf_render/raw/master/example/assets/hello.pdf'))
//       .path,
//   viewerController: controller,
//   onError: (err) => debugPrint(err),
//   params: const PdfViewerParams(
//     padding: 10,
//     minScale: 1.0,
//     // scrollDirection: Axis.horizontal,
//   ),
// )
// SfPdfViewer.network(
//   controller: _pdfViewerController,
//   initialZoomLevel : 0,
//   widget.url,
//   onDocumentLoaded: (details){
//     //_pdfViewerController.zoomLevel = PdfViewerZoomMode.fitWidth;
//   },
//   onDocumentLoadFailed: (cause){
//
//
//
//     debugPrint('${cause.description} ${widget.url} ');
//
//   },
// )
