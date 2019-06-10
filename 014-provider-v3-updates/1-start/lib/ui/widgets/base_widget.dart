import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_arc/core/changenotifiers/base_notifier.dart';

class BaseView<T extends BaseNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget child) builder;
  final T Function() notifierBuilder;
  final Function(T) onModelReady;

  BaseView({
    @required this.builder,
    @required this.notifierBuilder,
    this.onModelReady,
  });

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseNotifier> extends State<BaseView<T>> {
  T model;

  @override
  void initState() {
    model = widget.notifierBuilder();

    if (widget.onModelReady != null) {
      widget.onModelReady(model);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
        builder: (context) => model,
        child: Consumer<T>(builder: widget.builder));
  }
}
