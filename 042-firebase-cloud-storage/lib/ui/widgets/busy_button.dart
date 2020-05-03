import 'package:compound/ui/shared/shared_styles.dart';
import 'package:flutter/material.dart';

/// A button that shows a busy indicator in place of title
class BusyButton extends StatefulWidget {
  final bool busy;
  final String title;
  final Function onPressed;
  final bool enabled;
  const BusyButton(
      {@required this.title,
      this.busy = false,
      @required this.onPressed,
      this.enabled = true});

  @override
  _BusyButtonState createState() => _BusyButtonState();
}

class _BusyButtonState extends State<BusyButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: InkWell(
        child: AnimatedContainer(
          height: widget.busy ? 40 : null,
          width: widget.busy ? 40 : null,
          duration: const Duration(milliseconds: 300),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
              horizontal: widget.busy ? 10 : 15,
              vertical: widget.busy ? 10 : 10),
          decoration: BoxDecoration(
            color: widget.enabled ? Colors.grey[800] : Colors.grey[300],
            borderRadius: BorderRadius.circular(5),
          ),
          child: !widget.busy
              ? Text(
                  widget.title,
                  style: buttonTitleTextStyle,
                )
              : CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
        ),
      ),
    );
  }
}
