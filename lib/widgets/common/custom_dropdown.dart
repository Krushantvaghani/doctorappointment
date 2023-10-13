import 'package:doctorappointment/config.dart';

class CustomDropDown extends StatelessWidget {
  final dynamic dropdownValue;
  final ValueChanged<dynamic> onChangedValue;
  final List dropDownOptions;
  final String? displayKey;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hint;
  final String? hintText;
  final String? labelText;
  final double padding;
  final double radius;
  final FormFieldValidator<dynamic>? validator;
  final bool showBoarder;
  final TextStyle? style;

  const CustomDropDown({
    Key? key,
    required this.dropdownValue,
    required this.onChangedValue,
    required this.dropDownOptions,
    this.prefixIcon,
    this.suffixIcon,
    this.displayKey,
    this.hint,
    this.hintText,
    this.labelText,
    this.padding = 10,
    this.radius = 10,
    this.validator,
    this.showBoarder = true,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InputBorder inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: const BorderSide(style: BorderStyle.none),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
          color: appCtrl.appTheme.border,
          width: 1,
          style: showBoarder ? BorderStyle.solid : BorderStyle.none,
        ),
      ),
      child: DropdownButtonFormField<dynamic>(
        decoration: InputDecoration(
          enabledBorder: inputBorder,
          disabledBorder: inputBorder,
          border: inputBorder,
          focusedBorder: inputBorder,
          errorBorder: inputBorder,
          focusedErrorBorder: inputBorder,
          contentPadding: EdgeInsets.all(padding),
          filled: true,
          hintText: hintText,
          fillColor: appCtrl.appTheme.white,
          labelText: labelText,
          prefixIcon: prefixIcon != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Insets.i10),
                  child: prefixIcon,
                )
              : null,
        ),
        value: dropdownValue,
        isExpanded: true,
        icon: suffixIcon ?? const Icon(Icons.arrow_drop_down_sharp),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: appCtrl.appTheme.black),
        validator: validator,
        onChanged: onChangedValue,
        items: dropDownOptions.map<DropdownMenuItem<dynamic>>((dynamic val) {
          return DropdownMenuItem<dynamic>(
            value: val,
            child: Text("${displayKey != null ? val[displayKey] : val}",
                style: style ?? AppCss.paragraph, overflow: TextOverflow.ellipsis),
          );
        }).toList(),
      ),
    );
  }
}
