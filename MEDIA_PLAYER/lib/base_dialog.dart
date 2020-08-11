import 'dart:ui';

import 'package:flutter/material.dart';

/// Defines variants of entry animations
enum EntryAnimation {
  /// Appears in Center, standard Material dialog entrance animation, i.e. slow fade-in in the center of the screen.
  DEFAULT,

  /// Enters screen horizontally from the left
  LEFT,

  /// Enters screen horizontally from the right
  RIGHT,

  /// Enters screen horizontally from the top
  TOP,

  /// Enters screen horizontally from the bottom
  BOTTOM,

  /// Enters screen from the top left corner
  TOP_LEFT,

  /// Enters screen from the top right corner
  TOP_RIGHT,

  /// Enters screen from the bottom left corner
  BOTTOM_LEFT,

  /// Enters screen from the bottom right corner
  BOTTOM_RIGHT,
}

class BaseGiffyDialog extends StatefulWidget {
  BaseGiffyDialog({
    Key key,
    @required this.imageWidget,
    @required this.title,
    @required this.onOkButtonPressed,
    @required this.description,
    @required this.onlyOkButton,
    @required this.onlyCancelButton,
    @required this.buttonOkText,
    @required this.buttonCancelText,
    @required this.buttonOkColor,
    @required this.buttonCancelColor,
    @required this.cornerRadius,
    @required this.buttonRadius,
    @required this.entryAnimation,
    @required this.onCancelButtonPressed,
  }) : super(key: key);

  final Widget imageWidget;
  final Text title;
  final Text description;
  final bool onlyOkButton;
  final bool onlyCancelButton;
  final Text buttonOkText;
  final Text buttonCancelText;
  final Color buttonOkColor;
  final Color buttonCancelColor;
  final double buttonRadius;
  final double cornerRadius;
  final VoidCallback onOkButtonPressed;
  final VoidCallback onCancelButtonPressed;
  final EntryAnimation entryAnimation;

  @override
  _BaseGiffyDialogState createState() => _BaseGiffyDialogState();
}

class _BaseGiffyDialogState extends State<BaseGiffyDialog>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<Offset> _entryAnimation;

  get _start {
    switch (widget.entryAnimation) {
      case EntryAnimation.DEFAULT:
        break;
      case EntryAnimation.TOP:
        return Offset(0.0, -1.0);
      case EntryAnimation.TOP_LEFT:
        return Offset(-1.0, -1.0);
      case EntryAnimation.TOP_RIGHT:
        return Offset(1.0, -1.0);
      case EntryAnimation.LEFT:
        return Offset(-1.0, 0.0);
      case EntryAnimation.RIGHT:
        return Offset(1.0, 0.0);
      case EntryAnimation.BOTTOM:
        return Offset(0.0, 1.0);
      case EntryAnimation.BOTTOM_LEFT:
        return Offset(-1.0, 1.0);
      case EntryAnimation.BOTTOM_RIGHT:
        return Offset(1.0, 1.0);
    }
  }

  get _isDefaultEntryAnimation =>
      widget.entryAnimation == EntryAnimation.DEFAULT;

  @override
  void initState() {
    super.initState();
    if (!_isDefaultEntryAnimation) {
      _animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 300),
      );
      _entryAnimation =
          Tween<Offset>(begin: _start, end: Offset(0.0, 0.0)).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Curves.easeIn,
        ),
      )..addListener(() => setState(() {}));
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  Widget _buildPortraitWidget(BuildContext context, Widget imageWidget) {
    return Container(
      child: imageWidget,
      decoration: BoxDecoration(
          border: Border.all(
        width: 5,
        color: Colors.black,
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child:
          Container(child: _buildPortraitWidget(context, widget.imageWidget)),
    );
  }
}
