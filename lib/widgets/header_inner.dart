import 'package:helloworld/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class HeaderInner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(50.0)),
              color: Constants.blueLight,
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  child: Image.asset('assets/images/bg_2.png',
                      width: 352, height: 343),
                  top: -100,
                  right: -130,
                ),
                Positioned(
                  child: Image.asset('assets/images/bg_1.png',
                      width: 302, height: 343),
                  top: 20,
                  left: -100,
                ),
              ],
            ),
          ),
          flex: 1,
        ),
        Expanded(child: Container(), flex: 1)
      ],
    );
  }
}
