import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  final VoidCallback onPressed;

  const ButtonWidget({Key? key, required this.onPressed}) : super(key: key);

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        widget.onPressed();
      },
      child: const Text("Locate"),
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size>(const Size.fromHeight(45)),
        // primary: Colors.indigoAccent,
        backgroundColor: MaterialStateProperty.all<Color>(Colors.indigoAccent),
        shadowColor: MaterialStateProperty.all<Color>(Colors.indigoAccent),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
