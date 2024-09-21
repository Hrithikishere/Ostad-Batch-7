import 'package:flutter/material.dart';

InputDecoration appInputStyle(String label) {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    // filled: true,
    fillColor: Colors.blue[50],
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
    ),
    labelText: label,
    labelStyle: const TextStyle(color: Colors.black45, fontSize: 14),
    // hoverColor: Colors.redAccent,
  );
}

ButtonStyle appButtonStyle() {
  return ButtonStyle(
    backgroundColor: WidgetStateProperty.all(Colors.deepPurpleAccent),
    padding: WidgetStateProperty.all(const EdgeInsets.symmetric(vertical: 15)),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),

    // textStyle: WidgetStateProperty.all(
    //   const TextStyle(
    //     color: Colors.white,
    //     fontSize: 16,
    //     fontWeight: FontWeight.bold,
    //   ),
    // ),
  );
}
