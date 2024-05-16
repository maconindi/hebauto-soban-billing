import 'dart:io';
import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hebauto/core/util/ext/int.dart';

import '../../../../core/util/colors.dart';
import '../../../../core/util/config.dart';
import '../../../../core/util/decorations.dart';

class UploadItemWidget extends StatefulWidget {
  const UploadItemWidget({super.key});

  @override
  State<UploadItemWidget> createState() => _UploadItemWidgetState();
}

class _UploadItemWidgetState extends State<UploadItemWidget> {
  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: kPrimaryColor,
      strokeWidth: 2,
      borderType: BorderType.RRect,
      radius: Radius.circular(defaultItemsRadius),
      padding: const EdgeInsets.all(6),
      //radius: Radius.circular(defaultItemsRadius),
      dashPattern: const [10, 8],

      child: SizedBox(
        width: 200,
        height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.cloud_download_outlined,
              color: kPrimaryColor,
              size: 100,
            ),
            40.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () async {

                      FilePickerResult? result = await FilePicker.platform.pickFiles(
                        type: FileType.custom,
                        allowedExtensions: ['pdf', 'doc', 'jpeg','png','jpg', 'mp4','mov','avi','wmv'],
                      );

                      if (result != null) {

                        File dd = File.fromRawPath(result.files.single.bytes ?? Uint8List(0));

                        // DioClient dc = DioClient();
                        // dc.uploadFileRequest(url, converter: converter)

                        debugPrint('${dd.uri}<<<<');
                      } else {
                        // User canceled the picker
                      }


                    },
                    icon: Container(
                        decoration: boxDecorationWithRoundedCorners(
                            backgroundColor: kPrimaryColor),
                        height: 50,
                        width: 50,
                        child: const Icon(
                          Icons.edit,
                          color: white,
                        ))),
                IconButton(
                    onPressed: () {},
                    icon: Container(
                        height: 50,
                        width: 50,
                        decoration: boxDecorationWithRoundedCorners(
                            backgroundColor: deepSkyBlue),
                        child: const Icon(
                          Icons.delete,
                          color: white,
                        )))
              ],
            )
          ],
        ),
      ),
    );
  }
}
