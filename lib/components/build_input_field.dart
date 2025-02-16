import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildInputField extends StatefulWidget {
  final String label;
  final Function(String?) onSaved;
  final TextInputType keyboardType;
  final Widget suffixIcon;
  final bool isEnabled;
  final bool? isObsecure;
  const BuildInputField({
    super.key,
    required this.label,
    required this.onSaved,
    required this.keyboardType,
    required this.isEnabled,
    required this.suffixIcon,
    this.isObsecure,
  });

  @override
  State<BuildInputField> createState() => _BuildInputFieldState();
}

class _BuildInputFieldState extends State<BuildInputField> {
  List<TextInputFormatter> formatter = [];
  final bool _isObscureText = false;
  @override
  void initState() {
    if (widget.keyboardType == TextInputType.number) {
      formatter = [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(3),
      ];
    } else if (widget.keyboardType == TextInputType.phone) {
      formatter = [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(11),
      ];
    } else if (widget.keyboardType == TextInputType.name) {
      formatter = [
        FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
        FilteringTextInputFormatter.deny(RegExp(r'[/\\]')),
      ];
    } else if (widget.keyboardType == TextInputType.emailAddress) {
      formatter = [FilteringTextInputFormatter.deny(RegExp(r'[/\\]'))];
    } else if (widget.keyboardType == TextInputType.visiblePassword) {}
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 100,
      width: MediaQuery.of(context).size.width / 2,
      child: TextFormField(
        obscureText: widget.isObsecure ?? false,
        enabled: widget.isEnabled,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Color.fromARGB(255, 15, 199, 196),
          fontSize: 22,
        ),
        decoration: InputDecoration(
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 15),
            child: widget.suffixIcon,
          ),
          suffixIconColor: Colors.white,

          focusColor: Colors.pink,
          // hoverColor: Colors.green,
          floatingLabelAlignment: FloatingLabelAlignment.start,

          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 76, 147, 175),
              width: 2,
            ),
          ),

          // errorText: (widget.isValid) ? null : "Must be filled",
          errorStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),

          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 3),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          labelText: widget.label,
          labelStyle: GoogleFonts.montserrat(
            fontStyle: FontStyle.italic,
            fontSize: 15,
            color: const Color.fromARGB(255, 11, 164, 161),
          ),
          floatingLabelStyle: const TextStyle(
            // backgroundColor: Color.fromARGB(255, 30, 113, 187),
            color: Color.fromARGB(255, 58, 125, 185),
            letterSpacing: 3,
            fontSize: 25,
          ),
          contentPadding: const EdgeInsets.only(
            bottom: 20.0,
            left: 30.0,
            right: 10.0,
            top: 20,
          ),
          // filled: true,
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 76, 147, 175),
              width: 3,
            ),
          ),
        ),
        onSaved: widget.onSaved,
        keyboardType: widget.keyboardType,
        inputFormatters: formatter,
        validator: (value) {
          if (widget.isEnabled && (value == null || value.isEmpty)) {
            return 'Please enter a valid ${widget.label.split(":")[0]}';
          }
          if (widget.keyboardType == TextInputType.emailAddress) {
            if (value!.length > 5 && !value.contains("@")) {
              return "Email must contain @";
            }
          }
          return null;
        },
      ),
    );
  }
}
