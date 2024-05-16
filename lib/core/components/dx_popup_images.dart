import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hebauto/core/components/dx_image.dart';

class DxImagesDialog extends StatefulWidget {
  final List<String> images;

  DxImagesDialog({super.key, required this.images});

  @override
  State<DxImagesDialog> createState() => _DxImagesDialogState();
}

class _DxImagesDialogState extends State<DxImagesDialog> {
  final CarouselController _controller = CarouselController();

  late List<Widget> imageSliders = [];

  int currentIndex = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imageSliders = widget.images
        .map((item) => Container(
              margin: const EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      DxImage(
                        url: item,
                        fit: BoxFit.cover,
                        // width: context.width(),
                        // height: context.height(),
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: <Widget>[
                      //     Flexible(
                      //       child: ElevatedButton(
                      //         onPressed: () => _controller.previousPage(),
                      //         child: Text('←'),
                      //       ),
                      //     ),
                      //     Flexible(
                      //       child: ElevatedButton(
                      //         onPressed: () => _controller.nextPage(),
                      //         child: Text('→'),
                      //       ),
                      //     ),
                      //
                      //   ],
                      // )
                    ],
                  )),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //     appBar: AppBar(title: Text('Manually controlled slider')),
    //     body: SingleChildScrollView(
    //       child: Column(
    //         children: <Widget>[
    //           CarouselSlider(
    //             items: imageSliders,
    //             options: CarouselOptions(enlargeCenterPage: true, height: 200),
    //             carouselController: _controller,
    //           ),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: <Widget>[
    //               Flexible(
    //                 child: ElevatedButton(
    //                   onPressed: () => _controller.previousPage(),
    //                   child: Text('←'),
    //                 ),
    //               ),
    //               Flexible(
    //                 child: ElevatedButton(
    //                   onPressed: () => _controller.nextPage(),
    //                   child: Text('→'),
    //                 ),
    //               ),
    //               ...Iterable<int>.generate(imgList.length).map(
    //                     (int pageIndex) => Flexible(
    //                   child: ElevatedButton(
    //                     onPressed: () => _controller.animateToPage(pageIndex),
    //                     child: Text("$pageIndex"),
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           )
    //         ],
    //       ),
    //     ));
    return AlertDialog(
      content: SizedBox(
        // width: double.maxFinite,
        // height: 500, // Adjust height as needed
        child: CarouselSlider(
          items: imageSliders,
          options: CarouselOptions(enlargeCenterPage: true, ),
          carouselController: _controller,
        ),
      ),

      actionsAlignment: MainAxisAlignment.end,
      actions: <Widget>[


        // TextButton(
        //         //   onPressed: () {
        //         //     Navigator.of(context).pop();
        //         //   },
        //         //   child: const Text('Close'),
        //         // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {

                if(currentIndex == 1 ){
                  currentIndex = widget.images.length;
                }else {
                  currentIndex--;
                }
                _controller.previousPage();
                setState(() {

                });
              },
            ),
            Text('$currentIndex / ${widget.images.length}', style: const TextStyle(fontStyle: FontStyle.italic),),
            IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () {
                  if(currentIndex == widget.images.length ){
                    currentIndex = 1;
                  }else {
                    currentIndex++;
                  }


                  _controller.nextPage();

                  setState(() {

                  });
                }),
          ],
        ),

      ],
    );
  }
}
