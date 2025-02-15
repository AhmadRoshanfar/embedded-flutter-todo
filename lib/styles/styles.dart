import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

TextStyle kContainerStyle = GoogleFonts.montserrat(
    fontSize: 25, color: Colors.white, fontWeight: FontWeight.w500);

TextStyle kTextDrawerStyle = GoogleFonts.montserrat(
    fontSize: 20, color: Colors.white, fontWeight: FontWeight.w300);

TextStyle kTextDBTableStyle =
    const TextStyle(fontSize: 18, color: Colors.black);

TextStyle kTextDBRowTableStyle = GoogleFonts.roboto(
    fontStyle: FontStyle.italic,
    fontSize: 25,
    color: const Color.fromARGB(255, 178, 173, 173));

TextStyle kTextLinkStyle = GoogleFonts.roboto(
    fontStyle: FontStyle.italic,
    fontSize: 25,
    color: const Color.fromARGB(255, 189, 164, 20));

TextStyle kTextAppbarStyle = GoogleFonts.oswald(
    fontStyle: FontStyle.italic, fontSize: 25, color: Colors.white);

TextStyle kTextDatatableStyle = GoogleFonts.roboto(
    fontStyle: FontStyle.italic, fontSize: 25, color: Colors.white);

TextStyle kTextInputFieldStyle = GoogleFonts.roboto(
    fontStyle: FontStyle.normal,
    fontSize: 25,
    color: Colors.white,
    letterSpacing: 3);

TextStyle kTextChipsStyle = GoogleFonts.roboto(
    fontStyle: FontStyle.normal,
    fontSize: 20,
    color: const Color.fromARGB(255, 228, 228, 212),
    letterSpacing: 1);

TextStyle kTextButtonStyle = GoogleFonts.roboto(
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    fontSize: 25,
    color: const Color.fromARGB(255, 45, 45, 41),
    letterSpacing: 2);

TextStyle kTextInputFloatingStyle = GoogleFonts.roboto(
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    fontSize: 25,
    color: const Color(0xCCF2CD5C),
    letterSpacing: 2);

TextStyle kTextTopicStyle = GoogleFonts.oswald(
  fontStyle: FontStyle.normal,
  fontSize: 35,
  color: const Color.fromARGB(204, 245, 196, 52),
);

TextStyle kTextHeaderStyle = GoogleFonts.oswald(
  fontStyle: FontStyle.normal,
  fontSize: 50,
  color: const Color.fromARGB(204, 245, 196, 52),
);
