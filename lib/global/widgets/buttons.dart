



import 'package:flutter/material.dart';
import 'package:zresume/global/theme/pallete.dart';
import 'package:zresume/global/theme/theme.dart';
import 'package:zresume/global/widgets/shape.dart';

class SimpleOutlinedButton extends StatelessWidget {
  final Color? backgroundColor;
  final Color? color;
  final double? buttonHeight;
  final double? buttonWidth;
  final VoidCallback onPressed;
  final String text;

  const SimpleOutlinedButton({
    Key? key,
    this.backgroundColor,
    this.color,
    this.buttonHeight,
    this.buttonWidth,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: color,
              secondary: color,
            ),
      ),
      child: SizedBox(
        height: buttonHeight ?? 40,
        width: buttonWidth,
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            backgroundColor: backgroundColor ?? Pallete.backgroundColor,
            disabledForegroundColor: color?.withOpacity(0.4) ?? Colors.grey.withOpacity(0.38),
            side: BorderSide(width: 2.0, color: color ?? Pallete.primaryColor),
          ),
          child: Text(
            text,
            style: subtitle14.copyWith(color: color ?? Pallete.primaryColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class SimpleElevatedButton extends StatelessWidget {
  final Color? color;
  final Color? textColor;

  final double? roundedRadius;
  final double? buttonHeight;
  final double? buttonWidth;
  final double? elevation;
  final VoidCallback onPressed;
  final String text;

  const SimpleElevatedButton({
    Key? key,
    this.color,
    this.textColor,
    this.buttonHeight,
    this.buttonWidth,
    this.elevation,
    this.roundedRadius,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHeight ?? 40,
      width: buttonWidth,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ??    Pallete.primaryColor,
          shape: roundedRadius == null
              ? Shape.roundedRectangleBorderAll(10)
              : Shape.roundedRectangleBorderAll(roundedRadius!),
          shadowColor: Colors.black.withOpacity(0.5),
          elevation: elevation ?? 6,
        ),
        child: Text(
          text,
          style: subtitle14.copyWith(color: textColor ?? Pallete.backgroundColor, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}


