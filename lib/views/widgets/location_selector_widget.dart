import 'package:flutter/material.dart';   
import 'package:google_fonts/google_fonts.dart';

Future locationSelector({
  required BuildContext context,
  required GlobalKey<FormState> locationFormKey,
  required TextEditingController locationFormController,
  required Function(String city) onConfirmationPress,
}){
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Standort"),
        titleTextStyle: GoogleFonts.arOneSans(
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        content: Form(
          key: locationFormKey,
          child: TextFormField(
            controller: locationFormController,
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              border: UnderlineInputBorder(),
              labelText: "Standort festlegen",
              labelStyle: GoogleFonts.arOneSans(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
              floatingLabelStyle: GoogleFonts.arOneSans(
                fontSize: 12,
                color: Color.fromARGB(255, 3, 180, 244),
                fontWeight: FontWeight.normal,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Bitte gib einen Standort ein';
              } else if(RegExp(r'\d').hasMatch(value)){
                return 'Bitte gib einen Ort ein';
              }
              return null;
            }
          ),
        ),
        actions: [
          TextButton(
            child: Text(
              "Abbrechen",
              style: GoogleFonts.arOneSans(
                fontSize: 14,
                color: Color.fromARGB(255, 3, 180, 244),
                fontWeight: FontWeight.normal,
              ),
            ),
            onPressed: (){
              Navigator.of(context).pop();
              locationFormController.clear();
            },                            
          ),
          TextButton(
            child: Text(
              "Bestätigen",
              style: GoogleFonts.arOneSans(
                fontSize: 14,
                color: Color.fromARGB(255, 3, 180, 244),
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () async{
              print(locationFormKey.currentState);
              if (locationFormKey.currentState!.validate()) {
                Navigator.of(context).pop();
                await onConfirmationPress(locationFormController.text);
                locationFormController.clear();                                        
              }
            }, 
          ),
        ],
      );
    },
  );
}