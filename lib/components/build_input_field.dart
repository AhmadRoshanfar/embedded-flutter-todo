import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildInputField extends StatefulWidget {
  final String label;
  final Function(String?) onSaved;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool isPassword;

  const BuildInputField({
    super.key,
    required this.label,
    required this.onSaved,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
  });

  @override
  State<BuildInputField> createState() => _BuildInputFieldState();
}

class _BuildInputFieldState extends State<BuildInputField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  bool _obscureText = true;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();

    // Listen to focus changes
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child: TextFormField(
        controller: _controller,
        focusNode: _focusNode,
        autofocus: true,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white, fontSize: 22),
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: _isFocused ? FontWeight.bold : FontWeight.normal,
            color:
                _isFocused
                    ? Colors.amber
                    : const Color.fromARGB(255, 255, 255, 255),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 18,
            horizontal: 20,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(
              color: Color(0xFF99C1DE), // Soft blue border
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(
              color: Color.fromARGB(
                255,
                204,
                133,
                0,
              ), // Bright blue when focused
              width: 3,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(color: Colors.red, width: 2),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(color: Colors.red, width: 3),
          ),
          suffixIcon:
              widget.isPassword
                  ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color:
                          _isFocused
                              ? const Color(0xFF007BFF)
                              : const Color(0xFF888888),
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                  : null,
        ),
        obscureText: widget.isPassword ? _obscureText : false,
        onSaved: widget.onSaved,
        validator: widget.validator,
        keyboardType: widget.keyboardType,
      ),
    );
  }
}
