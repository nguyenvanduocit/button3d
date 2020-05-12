library button3d;

import 'package:flutter/material.dart';

class Button3dStyle {
  final Color topColor;
  final Color backColor;
  final BorderRadius borderRadius;
  final double z;
  final double tappedZ;
  const Button3dStyle(
      {this.topColor = const Color(0xFF45484c),
      this.backColor = const Color(0xFF191a1c),
      this.borderRadius = const BorderRadius.all(Radius.circular(7.0)),
      this.z = 8.0,
      this.tappedZ = 3.0});

  static const RED = const Button3dStyle(
      topColor: const Color(0xFFc62f2f), backColor: const Color(0xFF922525));
  static const BLUE = const Button3dStyle(
      topColor: const Color(0xFF25a09c), backColor: const Color(0xFF197572));
  static const WHITE = const Button3dStyle(
      topColor: const Color(0xFFffffff), backColor: const Color(0xFFCFD8DC));
}

class Button3d extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Button3dStyle style;
  final double width;
  final double height;

  Button3d(
      {@required this.onPressed,
      @required this.child,
      this.style = Button3dStyle.WHITE,
      this.width = 100.0,
      this.height = 90.0});

  @override
  State<StatefulWidget> createState() => Button3dState();
}

class Button3dState extends State<Button3d> {
  bool isTapped = false;

  Widget _buildBackLayout() {
    return Padding(
      padding: EdgeInsets.only(top: widget.style.z),
      child: DecoratedBox(
        position: DecorationPosition.background,
        decoration: BoxDecoration(
            borderRadius: widget.style.borderRadius,
            boxShadow: [BoxShadow(color: widget.style.backColor)]),
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(
              width: widget.width, height: widget.height - widget.style.z),
        ),
      ),
    );
  }

  Widget _buildTopLayout() {
    return Padding(
      padding: EdgeInsets.only(
          top: isTapped ? widget.style.z - widget.style.tappedZ : 0.0),
      child: DecoratedBox(
        position: DecorationPosition.background,
        decoration: BoxDecoration(
            borderRadius: widget.style.borderRadius,
            boxShadow: [BoxShadow(color: widget.style.topColor)]),
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(
              width: widget.width, height: widget.height - widget.style.z),
          child: Container(
            padding: EdgeInsets.zero,
            alignment: Alignment.center,
            child: widget.child,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: <Widget>[_buildBackLayout(), _buildTopLayout()],
      ),
      onTapDown: (TapDownDetails event) {
        setState(() {
          isTapped = true;
        });
      },
      onTapCancel: () {
        setState(() {
          isTapped = false;
        });
      },
      onTapUp: (TapUpDetails event) {
        setState(() {
          isTapped = false;
        });
        widget.onPressed();
      },
    );
  }
}
