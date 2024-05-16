import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hebauto/core/util/ext/ext.dart';
import 'package:hebauto/features_admin/dashboard/presentation/bloc/dashboard_states.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/components/dx_text.dart';
import '../../../../core/components/fd_button.dart';
import '../../../../core/components/fd_textfield.dart';
import '../../../../core/util/constants.dart';
import '../../../../core/util/decorations.dart';
import '../../../customer_profile/domain/usecase/customer_profile_usecase.dart';

import '../bloc/add_customer_bloc/add_customer_bloc.dart';
import '../bloc/add_customer_bloc/add_customer_event.dart';
import '../bloc/add_customer_bloc/add_customer_state.dart';

class AddCustomerScreen extends StatelessWidget {
  AddCustomerScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final companyNameController = TextEditingController();
  final tradingLicenseController = TextEditingController();
  final countryController = TextEditingController();
  final officeLocationController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void clearState(){
    firstNameController.clear();
    lastNameController.clear();
    companyNameController.clear();
    tradingLicenseController.clear();
    countryController.clear();
    officeLocationController.clear();
    emailController.clear();
    phoneNumberController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddCustomerBloc, AddCustomerState>(
      listener: (ctx, state) {
        if (state.status.isError) {
          state.message.toToastError(context);
        } else if (state.status.isSuccess) {
          state.message.toToastSuccess(context);
          clearState();

        }
      },
      child: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              defaultWidgetsVerticalSpacing,
              const DxText(
                text: 'REGISTER A NEW CLIENT',
                size: 40,
              ),
              defaultWidgetsVerticalSpacing,
              defaultWidgetsVerticalSpacing,
              Row(
                children: [
                  FDTextField(
                    controller: firstNameController,
                    textFieldType: TextFieldType.NAME,
                    decoration: defaultInputDecoration(label: 'First Name'),
                    validator: validateName,
                  ).expand(),
                  40.width,
                  FDTextField(
                    controller: lastNameController,
                    textFieldType: TextFieldType.NAME,
                    decoration: defaultInputDecoration(label: 'Last Name'),
                    validator: validateName,
                  ).expand(),
                ],
              ),
              defaultWidgetsVerticalSpacing,
              Row(
                children: [
                  FDTextField(
                    controller: companyNameController,
                    textFieldType: TextFieldType.NAME,
                    decoration:
                        defaultInputDecoration(label: 'Enter Company Name'),
                    validator: validateCompanyName,
                  ).expand(),
                  40.width,
                  FDTextField(
                          controller: tradingLicenseController,
                          textFieldType: TextFieldType.NAME,
                          decoration: defaultInputDecoration(
                              label: 'Enter Trading License Number'),
                          validator: validateTradingLicense)
                      .expand(),
                ],
              ),
              defaultWidgetsVerticalSpacing,

              defaultWidgetsVerticalSpacing,
              Row(
                children: [
                  FDTextField(
                    controller: emailController,
                    textFieldType: TextFieldType.NAME,
                    decoration: defaultInputDecoration(label: 'Enter Email'),
                    validator: validateEmail,
                  ).expand(),
                  40.width,
                  FDTextField(
                    controller: phoneNumberController,
                    textFieldType: TextFieldType.NAME,
                    decoration:
                        defaultInputDecoration(label: 'Enter Phone Number'),
                    validator: validatePhoneNumber,
                  ).expand(),
                ],
              ),
              defaultWidgetsVerticalSpacing,
              Row(
                children: [
                  FDTextField(
                    controller: passwordController,
                    textFieldType: TextFieldType.PASSWORD,
                    decoration: defaultInputDecoration(label: 'Enter Password'),
                    validator: validatePassword,
                  ).expand(),
                  40.width,
                  FDTextField(
                    controller: confirmPasswordController,
                    textFieldType: TextFieldType.PASSWORD,
                    decoration:
                        defaultInputDecoration(label: 'Confirm Password'),
                    validator: validateConfirmPassword,
                  ).expand(),
                ],
              ),
              defaultWidgetsVerticalSpacing,
              BlocBuilder<AddCustomerBloc, AddCustomerState>(
                builder: (context, state) {
                  if (state.status.isLoading) {
                    return const Align(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return FDButton(
                    width: context.width(),
                    text: 'CREATE CLIENT',
                    onTap: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        final uid =
                            const Uuid().v1().toString().replaceAll('-', '');
                        context.read<AddCustomerBloc>().add(
                              AddCustomerEvent(
                                params: CustomerParams(
                                  cusId: uid,
                                  name:
                                      '${firstNameController.text} ${lastNameController.text}',
                                  companyName: companyNameController.text,
                                  tradingLicenseNumber:
                                      tradingLicenseController.text,
                                  country: countryController.text,
                                  address: officeLocationController.text,
                                  email: emailController.text,
                                  phone: phoneNumberController.text,
                                  password: passwordController.text,
                                ),
                              ),
                            );
                      }
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  // Validators
  String? validateName(String? value) {
    if (value?.isEmpty ?? false) {
      return 'Please enter your name.';
    }
    return null;
  }

  String? validateCompanyName(String? value) {
    if (value?.isEmpty ?? false) {
      return 'Please enter your company name.';
    }
    return null;
  }

  String? validateTradingLicense(String? value) {
    if (value?.isEmpty ?? false) {
      return 'Please enter your trading license number.';
    }
    return null;
  }

  String? validateCountry(String? value) {
    if (value?.isEmpty ?? false) {
      return 'Please enter your country.';
    }
    return null;
  }

  String? validateOfficeLocation(String? value) {
    if (value?.isEmpty ?? false) {
      return 'Please enter your office location.';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value?.isEmpty ?? false) {
      return 'Please enter your email address.';
    } else if (!(value?.validateEmail() ?? false)) {
      return 'Please enter a valid email address.';
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value?.isEmpty ?? false) {
      return 'Please enter your phone number.';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value?.isEmpty ?? false) {
      return 'Please enter your password.';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value?.isEmpty ?? false) {
      return 'Please confirm your password.';
    } else if (value != passwordController.text) {
      return 'Passwords do not match.';
    }
    return null;
  }
}
