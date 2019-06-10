import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseWidget<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T notifier, Widget child) builder;
  final T notifier;
  final Function(T) onModelReady;

  BaseWidget({
    @required this.builder,
    @required this.notifier,
    this.onModelReady,
  });

  @override
  _BaseWidgetState<T> createState() => _BaseWidgetState<T>();
}

class _BaseWidgetState<T extends ChangeNotifier> extends State<BaseWidget<T>> {
  T notifier;

  @override
  void initState() {
    notifier = widget.notifier;

    if (widget.onModelReady != null) {
      widget.onModelReady(notifier);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: notifier,
      child: Consumer<T>(builder: widget.builder),
    );
  }
}
