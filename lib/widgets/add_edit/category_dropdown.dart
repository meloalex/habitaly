import 'package:flutter/material.dart';

import 'package:Habitaly/utilities/appearence.dart';

class CategoryDropdown extends StatefulWidget {
  final Function onChange;
  final Function validator;
  final Function onSaved;

  CategoryDropdown(
      {@required this.onChange,
      @required this.validator,
      @required this.onSaved});

  @override
  _CategoryDropdownState createState() => _CategoryDropdownState();
}

class _CategoryDropdownState extends State<CategoryDropdown> {
  String selectedValue = 'Category';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Container(
        decoration: BoxDecoration(
          color: Appearance.PRIMARY_LIGHT_COLOR,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Appearance.PRIMARY_COLOR,
            ),
            child: DropdownButtonFormField<String>(
              value: selectedValue,
              icon: Icon(
                Appearance.categoryIcons[selectedValue],
                size: 32,
                color: Colors.black54,
              ),
              elevation: 16,
              style: const TextStyle(
                fontFamily: "Roboto",
                fontWeight: FontWeight.w300,
                fontSize: 14,
                color: Colors.white,
              ),
              iconEnabledColor: Colors.black54,
              decoration: InputDecoration(
                errorStyle: const TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Colors.black54,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(12.0),
              ),
              onChanged: widget.onChange,
              validator: widget.validator,
              onSaved: widget.onSaved,
              items: Appearance.categoryIcons.keys
                  .toList()
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
