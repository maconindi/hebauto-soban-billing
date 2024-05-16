import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hebauto/core/util/ext/context.dart';
import 'package:hebauto/core/util/ext/ext.dart';
import 'package:lottie/lottie.dart';



import '../routing/app_route.dart';
import 'dx_text.dart';
import 'fd_button.dart';

class TopAnime extends StatelessWidget {
  Widget? child;
  Curve? curve;
  int seconds;
  int toppadding;

  TopAnime(this.seconds, this.toppadding, {required this.child, this.curve});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        child: child,
        tween: Tween<double>(begin: 0, end: 1),
        duration: Duration(seconds: seconds),
        curve: curve ?? Curves.bounceIn,
        builder: (BuildContext context, double value, child) {
          return Opacity(
            opacity: value,
            child: Padding(
              padding: EdgeInsets.only(top: value * toppadding),
              child: this.child,
            ),
          );
        });
  }
}

class BottomAnime extends StatelessWidget {
  Widget? child;
  Curve? curve;
  int seconds;
  int toppadding;

  BottomAnime(this.seconds, this.toppadding, {required this.child, this.curve});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        child: child,
        tween: Tween<double>(begin: 0, end: 1),
        curve: curve ?? Curves.bounceIn,
        duration: Duration(seconds: seconds),
        builder: (BuildContext context, double value, child) {
          return Opacity(
            opacity: value,
            child: Padding(
              padding: EdgeInsets.only(bottom: value * toppadding),
              child: this.child,
            ),
          );
        });
  }
}


class ErrorPage extends StatefulWidget {
  ErrorPage({Key? key}) : super(key: key);

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
/////////////////////////////////////
  /// @CodeWithFlexz on Instagram
  ///
  /// AmirBayat0 on Github
  /// Programming with Flexz on Youtube
/////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final currentHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: currentWidth,
          height: currentHeight,
          //color: const Color(0xff764fee),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // SizedBox(
              //   height: 300,
              //   width: 100,
              //   child: DxImage(
              //     url: AppAssets.imagesLogo,
              //     // width: context.width(),
              //     // height: context.height(),
              //   ),
              // ),



              // SizedBox(
              //     width: 200,
              //     height: 200,
              //     child: DxImage(url: AppAssets.imagesLogo, fit: BoxFit.fill,)),


              TopAnime(
                1,
                25,
                curve: Curves.fastOutSlowIn,
                child: SizedBox(
                  width: currentWidth,
                  height: currentHeight / 1.8,
                  child: Lottie.asset('assets/anim/62541-404-error-robot.json',
                      animate: false),
                ),
              ),
              TopAnime(
                2,
                5,
                curve: Curves.fastOutSlowIn,
                child: Container(
                  child: Column(
                    children: [
                      const DxText(
                        text:'PAGE NOT FOUND',
                        isBold: true,
                        size: 45,

                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: const DxText(
                          text: 'The page you are looking for was moved, removed renamed or might never existed.',
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // SizedBox(height: 40,),
              TopAnime(
                2,
                30,
                curve: Curves.fastOutSlowIn,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FDButton(
                        width: context.width() / 2,
                        text: 'Go to Customer Login',
                        onTap: () {

                          context.go(Routes.customerLogin.path);

                        },
                      ),
                      // FDButton(
                      //   width: context.width(),
                      //   text: 'Sign In',
                      //   onTap: () {
                      //
                      //   },
                      // ).expand(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}