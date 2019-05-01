import 'package:flutter/widgets.dart';

double screenHeight(BuildContext context,
    {int dividedBy = 1, double decreasedBy = 0.0}) {
  assert(dividedBy != 0, "Don't divide by 0");
  return (MediaQuery.of(context).size.height - decreasedBy) / dividedBy;
}
