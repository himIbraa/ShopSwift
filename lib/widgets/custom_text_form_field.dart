import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    Key? key,
    required this.title,
    this.onChanged,
  }) : super(key: key);

  final String title;
  final Function(String)? onChanged;

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              onChanged: widget.onChanged,
              decoration: InputDecoration(
                isDense: true,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                labelText: widget.title,
                labelStyle: TextStyle(
                  color: isFocused
                      ? Colors.black
                      : const Color.fromARGB(255, 93, 93, 93),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(15.0), // Adjust the radius
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(20.0), // Adjust the radius
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 179, 179, 179)),
                ),
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(15.0), // Adjust the radius
                ),
              ),
              onTap: () {
                setState(() {
                  isFocused = true;
                });
              },
              onFieldSubmitted: (value) {
                setState(() {
                  isFocused = false;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
