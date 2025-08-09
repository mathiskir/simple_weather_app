import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_weather_app/views/widgets/location_selector_widget.dart';

Widget topAppBar({
  required BuildContext context,
  required GlobalKey<FormState> locationFormKey,
  required TextEditingController locationFormController,
  required Function(String city) onConfirmationPress,
  required AsyncSnapshot<List<dynamic>> snapshot,
}){
  return Container(
    padding: EdgeInsets.only(top: 50, left: 15, right: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            locationSelector(
              context: context, 
              locationFormKey: locationFormKey, 
              locationFormController: locationFormController,
              onConfirmationPress: (city) {
                onConfirmationPress(city);
              },
            );
          },
          child: Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.location_pin,
                  color: Colors.white,
                  size: 20,
                ),
                onPressed: () {
                  locationSelector(
                    context: context, 
                    locationFormKey: locationFormKey, 
                    locationFormController: locationFormController,
                    onConfirmationPress: (city) {
                      onConfirmationPress(city);
                    },
                  );
                },
              ),
              Text(
                "${snapshot.data![0].location.name}",
                style: GoogleFonts.lexendExa(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          icon: Icon(Icons.info_outline, color: Colors.white, size: 25),
          onPressed: () {
            final snackBar = SnackBar(
              backgroundColor: snapshot.data![0].current.is_day!=0 ? Color.fromARGB(255, 3, 140, 244): Color.fromARGB(255, 3, 31, 244),
              content: Center(
                child: Text(
                  'Noch nichts zu sehen hier...',
                  style: GoogleFonts.lexendExa(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ),
              duration: Duration(seconds: 4),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        ),
      ],
    ),
  );
}