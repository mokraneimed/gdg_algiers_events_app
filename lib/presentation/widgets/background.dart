import 'package:flutter/material.dart';

class BackgroundImage extends StatefulWidget {
  final Widget child;

  const BackgroundImage({Key? key, required this.child}) : super(key: key);

  @override
  State<BackgroundImage> createState() => _BackgroundImageState();
}

class _BackgroundImageState extends State<BackgroundImage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/photos/background.PNG"),
                fit: BoxFit.cover),
          ),
        ),
        widget.child
      ],
    );
  }
}
