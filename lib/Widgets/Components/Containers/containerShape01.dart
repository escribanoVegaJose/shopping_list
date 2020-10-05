import 'package:flutter/widgets.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:shopping_list/Widgets/Design/DesignWidgets.dart';

class ContainerShape01 extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ClipPath(
      clipper: WaveClipperTwo(),
      child: Container(
        height: MediaQuery.of(context).size.height * .15,
        width: MediaQuery.of(context).size.width,
        decoration:
            BoxDecoration(gradient: DesignWidgets.linearGradientMain(context)),
      ),
    ));
  }
}
