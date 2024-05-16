import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hebauto/core/util/ext/ext.dart';
import 'package:hebauto/features_admin/customer_profile/domain/entity/customer_entity.dart';
import 'package:hebauto/features_admin/customer_profile/domain/usecase/customer_profile_usecase.dart';
import 'package:hebauto/features_admin/customer_profile/presentation/bloc/customer_profile_event.dart';

import '../../../../core/components/dx_text.dart';
import '../../../../core/components/dx_upload_file.dart';
import '../../../../core/components/fd_button.dart';
import '../../../../core/components/fd_textfield.dart';
import '../../../../core/util/decorations.dart';
import '../../../dashboard/presentation/widgets/page_controller_provider.dart';
import '../bloc/customer_profile_state.dart';
import '../bloc/cutomer_profile_bloc.dart';

class CustomerProfileScreen extends StatefulWidget {
  const CustomerProfileScreen({
    super.key,
  });

  @override
  State<CustomerProfileScreen> createState() => _CustomerProfileScreenState();
}

class _CustomerProfileScreenState extends State<CustomerProfileScreen> {
  PlatformFile? profileImage;
  PlatformFile? companyImage;
  PlatformFile? tradingLicense;

  CustomerEntity? customer;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final companyNameController = TextEditingController();
  final tradingLicenseController = TextEditingController();
  final countryController = TextEditingController();
  final officeLocationController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();

  //final confirmPasswordController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    customer = PageControllerProvider.of(context)?.user;

    if (customer != null) {
      final name = (customer?.name ?? '').split(' ').toList();
      if (name.length > 1) {
        firstNameController.text = name[0];
        lastNameController.text = name[1];
      }
      companyNameController.text = customer?.companyName ?? '';
      tradingLicenseController.text = customer?.tradingLicense ?? '';
      countryController.text = customer?.country ?? '';
      officeLocationController.text = customer?.address ?? '';
      emailController.text = customer?.email ?? '';
      phoneNumberController.text = customer?.phone ?? '';
      tradingLicenseController.text = customer?.tradingLicense ?? '';
      //phoneNumberController.text =  customer?.phone ?? '';
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SingleChildScrollView(
        child: Column(
          children: [
            20.height,
            20.height,
            // const Align(
            //   alignment: Alignment.centerLeft,
            //   child: DxText(
            //     text: 'Update Customer',
            //     isBold: true,
            //     size: 30,
            //   ),
            // ),
            20.height,
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                height: 300,
                width: 230,
                child: DxFileUpload(
                  heading: 'Profile Image',
                  fileType: FileType.image,
                  allowMultiple: false,
                  pickerCallback: (image) {
                    profileImage = image?.single;
                  },
                ),
              ),
            ),
            20.height,
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
            10.height,
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
            10.height,
            Row(
              children: [
                FDTextField(
                  controller: passwordController,
                  textFieldType: TextFieldType.PASSWORD,
                  decoration: defaultInputDecoration(label: 'New Password'),
                  validator: validateConfirmPassword,
                ).expand(),
                40.width,
                Container().expand(),
                // FDTextField(
                //   controller: passwordController,
                //   textFieldType: TextFieldType.PASSWORD,
                //   decoration: defaultInputDecoration(label: 'Current Password'),
                //   validator: validatePassword,
                // ).expand(),
              ],
            ),
            10.height,
            const Align(
              alignment: Alignment.centerLeft,
              child: DxText(
                text: 'Company Details',
                isBold: true,
                size: 30,
              ),
            ),
            10.height,
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
            10.height,
            Row(
              children: [
                FDTextField(
                  controller: countryController,
                  textFieldType: TextFieldType.NAME,
                  decoration: defaultInputDecoration(label: 'Country'),
                  validator: validateCountry,
                ).expand(),
                40.width,
                FDTextField(
                  controller: officeLocationController,
                  textFieldType: TextFieldType.NAME,
                  decoration:
                      defaultInputDecoration(label: 'Enter Office Location'),
                  validator: validateOfficeLocation,
                ).expand(),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                BlocBuilder<CustomerProfileBloc, CustomerProfileState>(
                  builder: (context, state) {
                    if (state.status.isLoading) {
                      return const CircularProgressIndicator();
                    }

                    if (state.status.isError) {
                      return Text('?? ${state.message}');
                    }
                    return FDButton(
                      text: 'Update',
                      onTap: () {
                        context
                            .read<CustomerProfileBloc>()
                            .add(UpdateCustomerEvent(
                              customer?.cusId ?? '',
                              CustomerParams(
                                //cusId: customer?.cusId ?? '',
                                name: '${firstNameController.text} ${lastNameController.text}',
                                companyName: companyNameController.text,
                                tradingLicenseNumber:
                                tradingLicenseController.text,
                                country: countryController.text,
                                address: officeLocationController.text,
                                email: emailController.text,
                                phone: phoneNumberController.text,
                                password: passwordController.text,
                              ),
                            ));
                      },
                    );
                  },
                ).expand(),
                50.width,
                SizedBox(
                  height: 300,
                  width: 230,
                  child: DxFileUpload(
                    heading: 'Company logo',
                    fileType: FileType.image,
                    allowMultiple: false,
                    pickerCallback: (image) {
                      profileImage = image?.single;
                    },
                  ),
                ),
                20.width,
                SizedBox(
                  height: 300,
                  width: 230,
                  child: DxFileUpload(
                    heading: 'Trading document',
                    fileType: FileType.media,
                    allowMultiple: false,
                    pickerCallback: (image) {
                      profileImage = image?.single;
                    },
                  ),
                ),
                50.width,
              ],
            ),

            200.height,
          ],
        ),
      ),
    );
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

  String? validateName(String? value) {
    if (value?.isEmpty ?? false) {
      return 'Please enter your name.';
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
