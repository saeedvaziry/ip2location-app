import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlagWidget extends StatefulWidget {
  final String code;
  final double width;
  final double height;

  const FlagWidget(
      {Key? key, required this.code, this.width = 30, this.height = 30})
      : super(key: key);

  @override
  State<FlagWidget> createState() => _FlagWidgetState();
}

class _FlagWidgetState extends State<FlagWidget> {
  @override
  Widget build(BuildContext context) {
    const String flagsPath = 'packages/country_icons/icons/flags/png/';

    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
        image: DecorationImage(
          image:
              ExactAssetImage(flagsPath + widget.code.toLowerCase() + '.png'),
          fit: BoxFit.fill,
          alignment: Alignment.center,
          repeat: ImageRepeat.noRepeat
        ),
        border: Border.all(color: Colors.white, width: 1),
      ),
      width: widget.width,
      height: widget.height,
    );
  }
}
