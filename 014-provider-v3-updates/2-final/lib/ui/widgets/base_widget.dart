import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseWidget<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T notifier, Widget child) builder;
  final T notifier;
  final Function(T) onNotifierReady;

  BaseWidget({
    @required this.builder,
    @required this.notifier,
    this.onNotifierReady,
  });

  @override
  _BaseWidgetState<T> createState() => _BaseWidgetState<T>();
}

class _BaseWidgetState<T extends ChangeNotifier> extends State<BaseWidget<T>> {
  T notifier;

  @override
  void initState() {
    notifier = widget.notifier;

    if (widget.onNotifierReady != null) {
      widget.onNotifierReady(notifier);
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
