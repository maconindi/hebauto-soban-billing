import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hebauto/core/components/dx_footer.dart';
import 'package:hebauto/core/components/dx_image.dart';
import 'package:hebauto/core/components/fd_button.dart';
import 'package:hebauto/core/lan/language.dart';
import 'package:hebauto/core/util/ext/context.dart';
import 'package:hebauto/core/util/ext/string.dart';
import 'package:hebauto/generated/assets.dart';

import '../../../../core/components/fd_textfield.dart';
import '../../../../core/routing/app_route.dart';
import '../../../../core/util/config.dart';
import '../../../../core/util/decorations.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';

const SERVER_FAILURE = 'Internal server error!';

class LoginScreenCustomer extends StatelessWidget {
  LoginScreenCustomer({super.key});

  final emailCont = TextEditingController();
  final passwordCont = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<CustomerLoginBloc, LoginState>(
      listener: (ctx, state) {
        if (state.authStatus.isError) {
          //debugPrint('${state.message}');

          state.message.toToastError(context);
          //SERVER_FAILURE.toToastError(context);
        } else if (state.authStatus.isAuthError) {
          state.message.toToastError(context);

          //debugPrint('${state.message}');
        } else if (state.authStatus.isSuccess) {
          context.go(Routes.dashboardCustomer.path);
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: context.width(),
                    height: context.height(),
                    child: DxImage(
                      url: Assets.bannersLoginBanner,
                      // width: context.width(),
                      // height: context.height(),
                    ),
                  ),
                  Container(
                    //color: whiteColor,
                    decoration: boxDecorationRoundedWithShadow(
                        defaultItemsRadius.toInt()),
                    width: context.isPhone()
                        ? context.width()
                        : context.width() / 3,

                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                const SizedBox(
                                  //width: context.width() / 5,
                                  child: DxImage(
                                    url: Assets.imagesLogo,
                                    // width: context.width(),
                                    // height: context.height(),
                                  ),
                                ),
                                Text(
                                  AppText().customerLogin,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  AppText().loginToYourAccount,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                FDTextField(
                                  textFieldType: TextFieldType.EMAIL,
                                  controller: emailCont,
                                  validator: (value) {
                                    if (value?.isEmpty ?? false) {
                                      return 'Email is required';
                                    } else if (!(value?.validateEmail() ??
                                        false)) {
                                      return 'Enter a valid email address';
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: defaultInputDecoration(
                                    label: AppText().enterEmail,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                FDTextField(
                                  textFieldType: TextFieldType.PASSWORD,
                                  controller: passwordCont,
                                  validator: (value) {
                                    if (value?.isEmpty ?? false) {
                                      return AppText().passwordIsRequired;
                                    } else if ((value?.length ?? 0) < 6) {
                                      return AppText()
                                          .lengthShouldBeGreaterThenSix;
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: defaultInputDecoration(
                                      label: AppText().password),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        AppText().forgotPassword,
                                        style: TextStyle(
                                          color: kPrimaryColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),

                                BlocBuilder<CustomerLoginBloc, LoginState>(
                                  builder: (context, state) {
                                    if (state.authStatus.isLoading) {
                                      return const Align(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                    return FDButton(
                                      width: context.width(),
                                      text: 'Sign In',
                                      onTap: () {
                                        if (_formKey.currentState?.validate() ??
                                            false) {
                                          context.read<CustomerLoginBloc>().add(
                                                LoginEvent(
                                                  email: emailCont.text.trim(),
                                                  password:
                                                      passwordCont.text.trim(),
                                                ),
                                              );
                                        }
                                      },
                                    );
                                  },
                                ),
                                const SizedBox(height: 10),
                                // Adjust spacing as needed
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (context.isPhone())
                const SizedBox.shrink()
              else
                const DxFooter()
            ],
          ),
        ),
      ),
    );
  }
}
