import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AvatarNetworkIcon extends StatelessWidget {
  const AvatarNetworkIcon({
    Key? key,
    required this.profileImage,
    required this.child,
    required this.height,
    required this.width,
    this.marginColor = const Color(0xfff4f6f8),
    this.marginWidth = 2,
  }) : super(key: key);

  final double height;
  final double width;
  final double marginWidth;
  final Color marginColor;
  final String profileImage;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.contain,
          image: NetworkImage(
            profileImage + "?width=9999",
          ),
        ),
        border: Border.all(
          color: marginColor,
          width: marginWidth,
        ),
      ),
      child: child,
    );
  }
}
