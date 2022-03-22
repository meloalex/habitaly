import 'package:flutter/material.dart';
import 'package:Habitaly/utilities/sizing_information.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget Function(
    BuildContext context,
    SizingInformation sizingInformation,
  ) builder;

  const ResponsiveWidget({Key key, this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return LayoutBuilder(builder: (context, boxConstraints) {
      var sizingInformation = SizingInformation(
        orientation: mediaQuery.orientation,
        screenSize: mediaQuery.size,
        localWidgetSize: Size(
          boxConstraints.maxWidth,
          boxConstraints.maxHeight,
        ),
      );
      return builder(context, sizingInformation);
    });
  }
}

// Usage Example

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      builder: (context, sizingInformation) {
        return Scaffold(
          body: Center(
            child: Text('Heyo'),
          ),
        );
      },
    );
  }
}
