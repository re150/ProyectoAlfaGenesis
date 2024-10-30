import 'package:flutter/material.dart';

class MyDropDownMenu extends StatelessWidget {
  final String? value;
  final List<String> items;
  final String hintText;
  final void Function(String?) onChanged;

  const MyDropDownMenu(
      {super.key,
      required this.value,
      required this.items,
      required this.hintText,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,

      hint: Text(
        hintText,
        style: const TextStyle(color: Colors.grey),
      ),

      items: items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),

      onChanged: onChanged,

      decoration: InputDecoration(

        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0)),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10.0),
        ),
        fillColor: Colors.white,
        filled: true,
        
      ),

      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),

      dropdownColor: Colors.white,

      icon: const Icon(
        Icons.arrow_drop_down,
        color: Colors.black,
      ),
    );
  }
}
