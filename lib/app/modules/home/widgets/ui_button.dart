import 'package:flutter/material.dart';

class UiButton extends StatelessWidget {
  final bool transparent;
  final String? label;
  final double? labelSize;
  final bool center;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? hoverColor;
  final Function()? onTap;

  const UiButton({
    super.key,
    this.transparent = false,
    this.label,
    this.labelSize,
    this.center = false,
    this.icon,
    this.backgroundColor,
    this.hoverColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
          const BoxConstraints(minHeight: 50, minWidth: double.infinity),
      child: ElevatedButton(
        onPressed: onTap ?? () {},
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStateProperty.all(!transparent
                ? backgroundColor ??
                    Theme.of(context).buttonTheme.colorScheme?.primary
                : Colors.transparent),
            overlayColor: MaterialStateProperty.all(hoverColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ))),
        child: Text(
          label!,
          style: TextStyle(
            color: Colors.white,
            fontSize: labelSize,
          ),
        ),
      ),
    );
  }
}
