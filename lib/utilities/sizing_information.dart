import 'package:flutter/widgets.dart';

class SizingInformation {
  final Orientation orientation;
  final Size screenSize;
  final Size localWidgetSize;

  SizingInformation({
    this.orientation,
    this.screenSize,
    this.localWidgetSize,
  });

  @override
  String toString() {
    return 'Orientation:$orientation, ScreenSize:$screenSize, LocalWidgetSize:$localWidgetSize';
  }
}
