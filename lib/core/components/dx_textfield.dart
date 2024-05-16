import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'package:hebauto/core/util/ext/ext.dart';

import '../util/util.dart';





/// Enum for Text Field
enum TextFieldType {
  EMAIL,
  EMAIL_ENHANCED,
  PASSWORD,
  NAME,
  MULTILINE,
  OTHER,
  PHONE,
  URL,
  NUMBER,
  USERNAME
}

class DxTextField extends StatefulWidget {
  final TextEditingController? controller;
  final TextFieldType textFieldType;
  final InputDecoration? decoration;
  final FocusNode? focus;
  final FormFieldValidator<String>? validator;
  final bool isValidationRequired;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final FocusNode? nextFocus;
  final TextStyle? textStyle;
  final TextAlign textAlign;
  final int? maxLines;
  final int? minLines;
  final bool? enabled;
  final bool autoFocus;
  final bool readOnly;
  final bool? enableSuggestions;
  final int? maxLength;
  final Color? cursorColor;
  final Widget? suffix;
  final Color? suffixIconColor;
  final TextInputType? keyboardType;
  final Iterable<String>? autoFillHints;
  final EdgeInsets? scrollPadding;
  final double? cursorWidth;
  final double? cursorHeight;
  final Function()? onTap;
  final InputCounterWidgetBuilder? buildCounter;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlignVertical? textAlignVertical;
  final bool expands;
  final bool? showCursor;
  final TextSelectionControls? selectionControls;
  final StrutStyle? strutStyle;
  final String obscuringCharacter;
  final String? initialValue;
  final Brightness? keyboardAppearance;
  final Widget? suffixPasswordVisibleWidget;
  final Widget? suffixPasswordInvisibleWidget;
  final EditableTextContextMenuBuilder? contextMenuBuilder;

  final String? errorThisFieldRequired;
  final String? errorInvalidEmail;
  final String? errorMinimumPasswordLength;
  final String? errorInvalidURL;
  final String? errorInvalidUsername;

  final String? title;
  final String hint;
  final TextStyle? titleTextStyle;
  final int spacingBetweenTitleAndTextFormField;
  final double height;
  final bool isStar;

  const DxTextField({
    this.controller,
    required this.textFieldType,
    this.decoration,
    this.focus,
    this.validator,
    this.buildCounter,
    this.isValidationRequired = true,
    this.textCapitalization,
    this.textInputAction,
    this.onFieldSubmitted,
    this.nextFocus,
    this.textStyle,

    this.textAlign = TextAlign.start,
    this.maxLines,
    this.minLines,
    this.enabled,
    this.onChanged,
    this.cursorColor,
    this.suffix,
    this.suffixIconColor,
    this.enableSuggestions,
    this.autoFocus = false,
    this.readOnly = false,
    this.maxLength,
    this.keyboardType,
    this.autoFillHints,
    this.scrollPadding,
    this.onTap,
    this.cursorWidth,
    this.cursorHeight,
    this.inputFormatters,
    this.errorThisFieldRequired,
    this.errorInvalidEmail,
    this.errorMinimumPasswordLength,
    this.errorInvalidURL,
    this.errorInvalidUsername,
    this.textAlignVertical,
    this.expands = false,
    this.showCursor,
    this.selectionControls,
    this.strutStyle,
    this.obscuringCharacter = '•',
    this.initialValue,
    this.keyboardAppearance,
    this.suffixPasswordVisibleWidget,
    this.suffixPasswordInvisibleWidget,
    this.contextMenuBuilder,
    this.title,
    this.hint = '',
    this.titleTextStyle,
    this.spacingBetweenTitleAndTextFormField = 4,
    this.height = defaultItemHeight,
    this.isStar = false,
    super.key,
  });

  @override
  DxTextFieldState createState() => DxTextFieldState();
}

class DxTextFieldState extends State<DxTextField> {
  bool isPasswordVisible = false;
  List<String> recentChat = [];

  FormFieldValidator<String>? applyValidation() {
    if (widget.isValidationRequired) {
      if (widget.validator != null) {
        return widget.validator;
      } else if (widget.textFieldType == TextFieldType.EMAIL) {
        return (s) {
          if (s!.trim().isEmpty) {
            return widget.errorThisFieldRequired
                ?.validate(value: errorThisFieldRequired);
          }
          if (!s.trim().validateEmail()) {
            return widget.errorInvalidEmail
                ?.validate(value: 'Email is invalid');
          }
          return null;
        };
      } else if (widget.textFieldType == TextFieldType.EMAIL_ENHANCED) {
        return (s) {
          if (s!.trim().isEmpty) {
            return widget.errorThisFieldRequired
                ?.validate(value: errorThisFieldRequired);
          }
          if (!s.trim().validateEmailEnhanced()) {
            return widget.errorInvalidEmail
                ?.validate(value: 'Email is invalid');
          }
          return null;
        };
      } else if (widget.textFieldType == TextFieldType.PASSWORD) {
        return (s) {
          if (s!.trim().isEmpty) {
            return widget.errorThisFieldRequired
                ?.validate(value: errorThisFieldRequired);
          }
          if (s.trim().length < passwordLengthGlobal) {
            return widget.errorMinimumPasswordLength?.validate(
                value:
                'Minimum password length should be $passwordLengthGlobal');
          }
          return null;
        };
      } else if (widget.textFieldType == TextFieldType.NAME ||
          widget.textFieldType == TextFieldType.PHONE ||
          widget.textFieldType == TextFieldType.NUMBER) {
        return (s) {
          if (s!.trim().isEmpty) {
            return widget.errorThisFieldRequired
                ?.validate(value: errorThisFieldRequired);
          }
          return null;
        };
      } else if (widget.textFieldType == TextFieldType.URL) {
        return (s) {
          if (s!.trim().isEmpty) {
            return widget.errorThisFieldRequired
                ?.validate(value: errorThisFieldRequired);
          }
          if (!s.validateURL()) {
            return widget.errorInvalidURL?.validate(value: 'Invalid URL');
          }
          return null;
        };
      } else if (widget.textFieldType == TextFieldType.USERNAME) {
        return (s) {
          if (s!.trim().isEmpty) {
            return widget.errorThisFieldRequired
                ?.validate(value: errorThisFieldRequired);
          }
          if (s.contains(' ')) {
            return widget.errorInvalidUsername
                ?.validate(value: 'Username should not contain space');
          }
          return null;
        };
      } else if (widget.textFieldType == TextFieldType.MULTILINE) {
        return (s) {
          if (s!.trim().isEmpty) {
            return widget.errorThisFieldRequired
                ?.validate(value: errorThisFieldRequired);
          }
          return null;
        };
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  TextCapitalization applyTextCapitalization() {
    if (widget.textCapitalization != null) {
      return widget.textCapitalization!;
    } else if (widget.textFieldType == TextFieldType.NAME) {
      return TextCapitalization.words;
    } else if (widget.textFieldType == TextFieldType.MULTILINE) {
      return TextCapitalization.sentences;
    } else {
      return TextCapitalization.none;
    }
  }

  TextInputAction? applyTextInputAction() {
    if (widget.textInputAction != null) {
      return widget.textInputAction;
    } else if (widget.textFieldType == TextFieldType.MULTILINE) {
      return TextInputAction.newline;
    } else if (widget.nextFocus != null) {
      return TextInputAction.next;
    } else {
      return TextInputAction.done;
    }
  }

  TextInputType? applyTextInputType() {
    if (widget.keyboardType != null) {
      return widget.keyboardType;
    } else if (widget.textFieldType == TextFieldType.EMAIL ||
        widget.textFieldType == TextFieldType.EMAIL_ENHANCED) {
      return TextInputType.emailAddress;
    } else if (widget.textFieldType == TextFieldType.MULTILINE) {
      return TextInputType.multiline;
    } else if (widget.textFieldType == TextFieldType.PASSWORD) {
      return TextInputType.visiblePassword;
    } else if (widget.textFieldType == TextFieldType.PHONE ||
        widget.textFieldType == TextFieldType.NUMBER) {
      return TextInputType.number;
    } else if (widget.textFieldType == TextFieldType.URL) {
      return TextInputType.url;
    } else {
      return TextInputType.text;
    }
  }

  void onPasswordVisibilityChange(bool val) {
    isPasswordVisible = val;
    setState(() {});
  }

  Widget? suffixIcon() {
    if (widget.textFieldType == TextFieldType.PASSWORD) {
      if (widget.suffix != null) {
        return widget.suffix;
      } else {
        if (isPasswordVisible) {
          if (widget.suffixPasswordVisibleWidget != null) {
            return widget.suffixPasswordVisibleWidget!.onTap(() {
              onPasswordVisibilityChange(false);
            });
          } else {
            return Icon(
              Icons.visibility,
              color:
              widget.suffixIconColor ?? Theme.of(context).iconTheme.color,
            ).onTap(() {
              onPasswordVisibilityChange(false);
            });
          }
        } else {
          if (widget.suffixPasswordInvisibleWidget != null) {
            return widget.suffixPasswordInvisibleWidget!.onTap(() {
              onPasswordVisibilityChange(true);
            });
          } else {
            return Icon(
              Icons.visibility_off,
              color:
              widget.suffixIconColor ?? Theme.of(context).iconTheme.color,
            ).onTap(() {
              onPasswordVisibilityChange(true);
            });
          }
        }
      }
    } else {
      return widget.suffix;
    }
  }

  Iterable<String>? applyAutofillHints() {
    if (widget.textFieldType == TextFieldType.EMAIL ||
        widget.textFieldType == TextFieldType.EMAIL_ENHANCED) {
      return [AutofillHints.email];
    } else if (widget.textFieldType == TextFieldType.PASSWORD) {
      return [AutofillHints.password];
    }
    return null;
  }

  Widget textFormFieldWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      height: widget.height,
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.textFieldType == TextFieldType.PASSWORD &&
            !isPasswordVisible,
        validator: applyValidation(),
        textCapitalization: applyTextCapitalization(),
        textInputAction: applyTextInputAction(),
        onFieldSubmitted: (s) {
          if (widget.nextFocus != null) {
            FocusScope.of(context).requestFocus(widget.nextFocus);
          }

          if (widget.onFieldSubmitted != null) widget.onFieldSubmitted!.call(s);
        },
        keyboardType: applyTextInputType(),
        decoration: widget.decoration != null
            ? (widget.decoration?.copyWith(
          suffixIcon: suffixIcon(),
        ))
            : InputDecoration(hintText: widget.hint,),
        focusNode: widget.focus,
        style: widget.textStyle ?? primaryTextStyle(color: blackColor),
        textAlign: widget.textAlign,
        maxLines: widget.maxLines.validate(
          value: widget.textFieldType == TextFieldType.MULTILINE ? 10 : 1,
        ),
        minLines: widget.minLines.validate(
          value: widget.textFieldType == TextFieldType.MULTILINE ? 2 : 1,
        ),
        autofocus: widget.autoFocus,
        enabled: widget.enabled,
        onChanged: widget.onChanged,
        cursorColor: widget.cursorColor ??
            Theme.of(context).textSelectionTheme.cursorColor,
        readOnly: widget.readOnly,
        maxLength: widget.maxLength,
        enableSuggestions: widget.enableSuggestions.validate(value: true),
        autofillHints: widget.autoFillHints ?? applyAutofillHints(),
        scrollPadding: widget.scrollPadding ?? const EdgeInsets.all(20),
        cursorWidth: widget.cursorWidth.validate(value: 2.0),
        cursorHeight: widget.cursorHeight,
        cursorRadius: radiusCircular(4),
        onTap: widget.onTap,
        buildCounter: widget.buildCounter,
        scrollPhysics: const BouncingScrollPhysics(),
        enableInteractiveSelection: true,
        inputFormatters: widget.inputFormatters,
        textAlignVertical: widget.textAlignVertical,
        expands: widget.expands,
        showCursor: widget.showCursor,
        selectionControls:
        widget.selectionControls ?? MaterialTextSelectionControls(),
        strutStyle: widget.strutStyle,
        obscuringCharacter: widget.obscuringCharacter,
        initialValue: widget.initialValue,
        keyboardAppearance: widget.keyboardAppearance,
        contextMenuBuilder: widget.contextMenuBuilder,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.title.toString().validate().isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                widget.title ?? '',
                style: widget.titleTextStyle ?? primaryTextStyle(),
              ),
              widget.isStar? Text(
                ' *',
                style: secondaryTextStyle(size: 20, color: redColor),
              ) : Container()
            ],
          ),
          widget.spacingBetweenTitleAndTextFormField.height,
          textFormFieldWidget(),
        ],
      );
    }

    return textFormFieldWidget();
  }
}
