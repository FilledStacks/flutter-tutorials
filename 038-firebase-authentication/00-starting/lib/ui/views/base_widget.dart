import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseWidget<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget child) builder;
  final Function(T) onModelReady;
  final T model;
  final Widget child;

  BaseWidget({this.builder, this.onModelReady, this.model, this.child});

  @override
  _BaseWidgetState<T> createState() => _BaseWidgetState<T>();
}

class _BaseWidgetState<T extends ChangeNotifier> extends State<BaseWidget<T>> {
  T _model;

  @override
  void initState() {
    _model = widget.model;

    if (widget.onModelReady != null) {
      widget.onModelReady(_model);
    }
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
        builder: (context) => _model,
        child: Consumer<T>(
          child: widget.child,
          builder: widget.builder ?? (context, model, child) => child,
        ));
  }
}
