import 'package:diario_noticias/home_page.dart';
import 'package:diario_noticias/noticia_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  GetIt getIt = GetIt.I;
  getIt.registerSingleton<ControllerNoticias>(ControllerNoticias());

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        textTheme: GoogleFonts.oswaldTextTheme()
      ),
    )
  );
} 