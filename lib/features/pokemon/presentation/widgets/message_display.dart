import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_pokedex_sample/themes/theme_style.dart';

class MessageDisplay extends StatelessWidget {
  final String message;

  const MessageDisplay({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: defaultFont
      ),
    );
  }
}
