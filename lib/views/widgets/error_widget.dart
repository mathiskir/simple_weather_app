import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget error({
  required AsyncSnapshot<List<dynamic>> snapshot,
  required BuildContext context,
}){
  return Container(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color.fromARGB(255, 3, 180, 244), Color.fromARGB(255, 3, 140, 244)],
      ),
    ),
    child: Container(
      margin: EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
      padding: EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            color: Colors.white,
          ),
          SizedBox(height: 10,),
          Text(
            "Fehler beim Laden der Wetterdaten",
            style: GoogleFonts.arOneSans(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "${snapshot.error}",
            textAlign: TextAlign.center,
            style: GoogleFonts.arOneSans(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.normal,
            ),
          )
        ],
      ),
    ),
  );
}