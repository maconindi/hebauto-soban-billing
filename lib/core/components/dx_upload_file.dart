import 'dart:io';
import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hebauto/core/components/dx_image.dart';
import 'package:hebauto/core/components/dx_text.dart';
import 'package:hebauto/core/util/constants.dart';
import 'package:hebauto/core/util/ext/context.dart';
import 'package:hebauto/core/util/ext/int.dart';

import '../util/colors.dart';
import '../util/config.dart';
import '../util/decorations.dart';

class DxFileUpload extends StatefulWidget {
  final FileType fileType;
  final String heading;
  final Function(List<PlatformFile>?) pickerCallback;
  final bool allowMultiple;
  final List<String> urls;

  const DxFileUpload({
    super.key,
    required this.fileType,
    this.heading = '',
    required this.pickerCallback,
    this.allowMultiple = true,
    this.urls = const [],
  });

  @override
  State<DxFileUpload> createState() => DxFileUploadState();
}

class DxFileUploadState extends State<DxFileUpload> {
  File? imageFile;

  Uint8List? image;

  FilePickerResult? result;

  final scrollController = ScrollController();
  List<String> urls = [];

  void reset(){
    setState(() {
      result = null;
      image = null;
      urls = [];
      imageFile = null;
    });
  }

  @override
  void initState() {
    super.initState();

    urls = widget.urls.where((element) => element.contains('http')).toList();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: result != null || urls.isNotEmpty
          ? null
          : () async {
              result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: vExt(),
                  allowMultiple: widget.allowMultiple);

              final filesList = result?.files;

              widget.pickerCallback.call(filesList);

              // final List<Uint8List?> bytesList = [];
              // final List<String?> fileNames = [];
              //
              // Future.sync(() => {
              //       Future.forEach(
              //           result?.files ?? [],
              //           (element) => {
              //                 bytesList.add(element.bytes),
              //                 fileNames.add(element.name),
              //               })
              //     });

              // Future.microtask(() => {
              //       result?.files.forEach((element) {
              //         bytesList.add(element.bytes);
              //         fileNames.add(element.name);
              //       }),
              //       widget.pickerCallback.call(bytesList, fileNames)
              //     });

              // if (widget.allowMultiple) {
              // } else {
              //     widget.pickerCallback.call(
              //     result?.files.first.bytes ?? Uint8List(0),
              //     result?.files.first.name ?? '',
              //   );
              // }

              setState(() {});
            },
      child: DottedBorder(
        color: kPrimaryColor,
        strokeWidth: 2,
        borderType: BorderType.RRect,
        radius: Radius.circular(defaultItemsRadius),
        padding: const EdgeInsets.all(6),
        dashPattern: const [10, 8],
        child: (result != null ||
                (result?.files.isEmpty ?? false) ||
                (urls.length > 0))
            ? SizedBox(
                width: context.width(),
                height: 250,
                child: urls.length <= 0 ? lView() : lViewUrl(),
              )
            : SizedBox(
                width: context.width(),
                //height: 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    widget.heading.isEmpty
                        ? const SizedBox.shrink()
                        : Container(
                            padding: EdgeInsets.all(5.0),
                            margin: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Center(
                              child: Text(
                                '${widget.heading}',
                                style: TextStyle(color: kPrimaryColor),
                              ),
                            ),
                            decoration: boxDecorationWithRoundedCorners(
                                border: Border.all(color: kPrimaryColor)),
                          ),
                    Icon(
                      Icons.cloud_download_outlined,
                      color: kPrimaryColor,
                      size: 100,
                    ),
                    10.height,
                    Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        DxText(
                          text: 'Browse ',
                          size: 20,
                          color: kPrimaryColor,
                        ),
                        DxText(
                          text: 'to upload ${widget.fileType.name} \n ',
                          size: 20,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DxText(
                          text: 'Formats : ',
                          color: kPrimaryColor,
                          size: 15,
                        ),
                        Wrap(
                          children: vExt()
                              .map((e) => DxText(
                                    text: '[ $e ] ',
                                    size: 15,
                                  ))
                              .toList(),
                        ),
                      ],
                    )
                  ],
                ),
              ),
      ),
    );
  }

  List<String> vExt() {
    switch (widget.fileType) {
      case FileType.image:
        return ['jpeg', 'png', 'jpg'];
      case FileType.video:
        return ['mp4', 'mov', 'avi', 'wmv'];
      case FileType.media:
        return ['pdf'];
      default:
        return [];
    }
  }

  Widget lViewUrl() {
    return Scrollbar(
      thumbVisibility: true,
      thickness: 10,
      controller: scrollController,
      radius: Radius.circular(defaultItemsRadius),
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        controller: scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        children: urls
            .map((e) => Column(
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      clipBehavior: Clip.hardEdge,
                      decoration: boxDecorationWithRoundedCorners(
                          border: Border.all(color: redColor)),
                      child: pickedUrlWidget(e),
                    ),
                    defaultWidgetsVerticalSpacing,
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Container(
                            height: 50,
                            width: 50,
                            decoration: boxDecorationWithRoundedCorners(
                              backgroundColor: redColor,
                            ),
                            child: const Icon(
                              Icons.delete,
                              color: white,
                            ),
                          ),
                        ),
                        // IconButton(
                        //     onPressed: () async {
                        //       // final file = await FilePicker.platform
                        //       //     .pickFiles(
                        //       //     type: FileType.custom,
                        //       //     allowedExtensions: vExt(),
                        //       //     allowMultiple: false);
                        //       // int index = result?.files.indexOf(e) ?? 0;
                        //       // result?.files.removeAt(index);
                        //       // result?.files.insert(
                        //       //     index,
                        //       //     file?.files.first ??
                        //       //         PlatformFile(name: '', size: 0));
                        //       // final fileList = result?.files;
                        //       // widget.pickerCallback.call(fileList);
                        //
                        //       //setState(() {});
                        //     },
                        //     icon: Container(
                        //         height: 50,
                        //         width: 50,
                        //         decoration: boxDecorationWithRoundedCorners(
                        //             backgroundColor: deepSkyBlue),
                        //         child: const Icon(
                        //           Icons.edit_outlined,
                        //           color: white,
                        //         ))),
                      ],
                    )
                  ],
                ))
            .toList(),
      ),
    );
  }

  Widget lView() {
    return Scrollbar(
      thumbVisibility: true,
      thickness: 10,
      controller: scrollController,
      radius: Radius.circular(defaultItemsRadius),
      child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          controller: scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          children: result?.files
                  .map((e) => Column(
                        children: [
                          Container(
                              height: 150,
                              width: 150,
                              alignment: Alignment.center,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              clipBehavior: Clip.hardEdge,
                              decoration: boxDecorationWithRoundedCorners(
                                  border: Border.all(color: redColor)),
                              child: pickedFiles(e.bytes)),
                          defaultWidgetsVerticalSpacing,
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    if (result?.files.length == 1) {
                                      result?.files.removeWhere(
                                          (element) => element.name == e.name);
                                      result = null;
                                    } else {
                                      result?.files.removeWhere(
                                          (element) => element.name == e.name);
                                    }
                                    setState(() {});
                                  },
                                  icon: Container(
                                      height: 50,
                                      width: 50,
                                      decoration:
                                          boxDecorationWithRoundedCorners(
                                              backgroundColor: redColor),
                                      child: const Icon(Icons.delete,
                                          color: white))),
                              IconButton(
                                  onPressed: () async {
                                    final file = await FilePicker.platform
                                        .pickFiles(
                                            type: FileType.custom,
                                            allowedExtensions: vExt(),
                                            allowMultiple: false);
                                    int index = result?.files.indexOf(e) ?? 0;
                                    result?.files.removeAt(index);
                                    result?.files.insert(
                                        index,
                                        file?.files.first ??
                                            PlatformFile(name: '', size: 0));
                                    final fileList = result?.files;
                                    widget.pickerCallback.call(fileList);

                                    setState(() {});
                                  },
                                  icon: Container(
                                      height: 50,
                                      width: 50,
                                      decoration:
                                          boxDecorationWithRoundedCorners(
                                              backgroundColor: deepSkyBlue),
                                      child: const Icon(
                                        Icons.edit_outlined,
                                        color: white,
                                      ))),
                            ],
                          )
                        ],
                      ))
                  .toList() ??
              <Widget>[]),
    );
  }

  Widget pickedUrlWidget(String url) {
    switch (widget.fileType) {
      case FileType.image:
        return DxImage(
          fit: BoxFit.cover,
          url: url,
          // width: context.width(),
          // height: context.height(),
        );
      case FileType.video:
        return Center(
          child: Icon(
            Icons.ondemand_video_rounded,
            size: 40,
            color: kPrimaryColor,
          ),
        );
      case FileType.media:
        return Center(
          child: Icon(
            Icons.picture_as_pdf,
            size: 40,
            color: kPrimaryColor,
          ),
        );
      default:
        return Container();
    }
  }

  Widget pickedFiles(Uint8List? ee) {
    switch (widget.fileType) {
      case FileType.image:
        if (result != null) {
          return Image.memory(
            ee ?? Uint8List(0),
            fit: BoxFit.cover,
          );
        }
        return Container();
      case FileType.video:
        return Center(
          child: Icon(
            Icons.ondemand_video_rounded,
            size: 40,
            color: kPrimaryColor,
          ),
        );
      case FileType.media:
        return Center(
          child: Icon(
            Icons.picture_as_pdf,
            size: 40,
            color: kPrimaryColor,
          ),
        );
      default:
        return Container();
    }
  }
}
