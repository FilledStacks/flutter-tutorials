import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            ...List<int>.generate(5, (index) => index).map(
              (e) => SliverToBoxAdapter(
                child: Container(
                  height: 300,
                  color: Colors.red,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                ),
              ),
            ),
            StickySliver(
              child: Container(
                height: 400,
                color: Colors.purple,
              ),
            ),
            ...List<int>.generate(5, (index) => index).map(
              (e) => SliverToBoxAdapter(
                child: Container(
                  height: 300,
                  color: Colors.red,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RenderStickySliver extends RenderSliverSingleBoxAdapter {
  RenderStickySliver({RenderBox? child}) : super(child: child);

  @override
  void performLayout() {
    var myCurrentConstraints = constraints;

    geometry = SliverGeometry.zero;

    child?.layout(
      constraints.asBoxConstraints(),
      parentUsesSize: true,
    );

    double childExtent = child?.size.height ?? 0;

    geometry = SliverGeometry(
      paintExtent: childExtent,
      maxPaintExtent: childExtent,
      paintOrigin: constraints.scrollOffset,
    );

    setChildParentData(child!, constraints, geometry!);
  }
}

class StickySliver extends SingleChildRenderObjectWidget {
  StickySliver({Widget? child, Key? key}) : super(child: child, key: key);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderStickySliver();
  }
}
