import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:namaz_app/app/ui/shared/text_widget.dart';

class NearMeScreen extends StatelessWidget {
  const NearMeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CustomTextWidget(
         text:  'Under Construction',
         fontSize: 24,
         color: Colors.black,
         fontWeight: FontWeight.bold,
         textAlign: TextAlign.center,
         maxLines: 1,
       font: GoogleFonts.lancelot(),
        
        ),
      ),
    );
  }
}