// Define a custom PageController that controls both PageViews
import 'package:flutter/cupertino.dart';

class CustomPageController extends PageController {
  @override
  Future<void> nextPage(
      {required Duration duration, required Curve curve}) async {
    await super.nextPage(duration: duration, curve: curve);
  }

  @override
  Future<void> previousPage(
      {required Duration duration, required Curve curve}) async {
    await super.previousPage(duration: duration, curve: curve);
  }
}
