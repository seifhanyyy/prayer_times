import 'package:flutter/material.dart';
import 'Home_Page.dart';
import 'main.dart';
class Playground extends StatefulWidget {
  Playground({Key key}) : super(key: key);

  @override
  _PlaygroundState createState() => _PlaygroundState();
}

class _PlaygroundState extends State<Playground> with TickerProviderStateMixin {
  AnimationController _squareTopLeftAnimCont;
  Animation<double> _squareTopLeftAnim;

  AnimationController _squareTopRightAnimCont;
  Animation<double> _squareTopRightAnim;

  AnimationController _squareBottomLeftAnimCont;
  Animation<double> _squareBottomLeftAnim;

  AnimationController _squareBottomRightAnimCont;
  Animation<double> _squareBottomRightAnim;

  AnimationController _squareColorAnimCont;
  Animation<double> _squareColorAnim;

  bool _displayText = false;

  @override
  void initState() {
    super.initState();

    this._initAnimations();
  }

  void _initAnimations() async {
    _squareTopLeftAnimCont = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);

    _squareTopLeftAnim = Tween<double>(begin: 0, end: 300).animate(
        CurvedAnimation(
            parent: _squareTopLeftAnimCont, curve: Curves.bounceOut));

    _squareTopRightAnimCont = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _squareTopRightAnim = Tween<double>(begin: 0, end: 300).animate(
        CurvedAnimation(
            parent: _squareTopRightAnimCont, curve: Curves.bounceOut));

    _squareBottomLeftAnimCont = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _squareBottomLeftAnim = Tween<double>(begin: 0, end: 300).animate(
        CurvedAnimation(
            parent: _squareBottomLeftAnimCont, curve: Curves.bounceOut));

    _squareBottomRightAnimCont = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _squareBottomRightAnim = Tween<double>(begin: 0, end: 300).animate(
        CurvedAnimation(
            parent: _squareBottomRightAnimCont, curve: Curves.bounceOut));

    _squareColorAnimCont = AnimationController(
        duration: const Duration(milliseconds: 1800), vsync: this);

    _squareColorAnim = Tween<double>(begin: 0, end: 12).animate(
        CurvedAnimation(parent: _squareColorAnimCont, curve: Curves.bounceOut));

    this._executeAnimation(animation: _squareTopLeftAnimCont, interval: 300);

    this._executeAnimation(animation: _squareTopRightAnimCont, interval: 500);

    this._executeAnimation(animation: _squareBottomLeftAnimCont, interval: 600);

    this._executeAnimation(
        animation: _squareBottomRightAnimCont, interval: 900);

    _squareBottomRightAnimCont.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _squareColorAnimCont.forward();



        setState(() {
          _displayText = true;
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
        });
      }

    });
  }

  void _executeAnimation({animation: AnimationController, interval: double}) {
    Future.delayed(Duration(milliseconds: interval), () {
      if (animation != null) {
        animation.forward();
      }
    });
    if (animation == AnimationStatus.completed)
      {

      }
  }

  @override
  void dispose() {
    _squareTopLeftAnimCont?.dispose();
    _squareTopRightAnimCont?.dispose();
    _squareBottomLeftAnimCont?.dispose();
    _squareBottomRightAnimCont?.dispose();
    _squareColorAnimCont?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
                bottom: MediaQuery.of(context).size.height * 0.1,
                child: AnimatedOpacity(
                    duration: Duration(milliseconds: 1500),
                    opacity: _displayText ? 1 : 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Prayer",
                            style: TextStyle(
                                fontFamily: 'Ubuntu',
                                fontSize: 76,
                                shadows: [
                                  Shadow(
                                    color: Colors.black.withOpacity(.5),
                                    blurRadius: 20.0,
                                    offset: Offset(
                                      5.0,
                                      5.0,
                                    ),
                                  )
                                ]),
                          ),
                          Text(
                            "Times",
                            style: TextStyle(
                                fontFamily: 'Ubuntu',
                                color: Colors.red,
                                fontSize: 60,
                                shadows: [
                                  Shadow(
                                    color: Colors.black.withOpacity(.5),
                                    blurRadius: 20.0,
                                    offset: Offset(
                                      5.0,
                                      5.0,
                                    ),
                                  )
                                ],
                                fontWeight: FontWeight.w800),
                          )
                        ],
                      ),
                    ))),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.3,
              height: MediaQuery.of(context).size.height * 0.2,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.width * 0.3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          AnimatedBuilder(
                              animation: _squareTopLeftAnim,
                              builder: (ctx, ch) => Container(
                                  width: MediaQuery.of(context).size.width *
                                      _squareTopLeftAnim.value /
                                      1200,
                                  height: MediaQuery.of(context).size.width *
                                      _squareTopLeftAnim.value /
                                      1200,
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(245, 0, 0, 1),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(.5),
                                          blurRadius: 20.0,
                                          spreadRadius: 0.0,
                                          offset: Offset(
                                            5.0,
                                            5.0,
                                          ),
                                        )
                                      ])))
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.width * 0.3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AnimatedBuilder(
                              animation: _squareTopRightAnim,
                              builder: (ctx, ch) => Container(
                                    width: MediaQuery.of(context).size.width *
                                        _squareTopRightAnim.value /
                                        1200,
                                    height: MediaQuery.of(context).size.width *
                                        _squareTopRightAnim.value /
                                        1200,
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(245, 0, 0, 1),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(.5),
                                            blurRadius: 20.0,
                                            spreadRadius: 0.0,
                                            offset: Offset(
                                              5.0,
                                              5.0,
                                            ),
                                          )
                                        ]),
                                  ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 8 + (MediaQuery.of(context).size.height * 0.5),
              height: MediaQuery.of(context).size.height * 0.2,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.width * 0.3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          AnimatedBuilder(
                              animation: _squareBottomLeftAnim,
                              builder: (ctx, ch) => Container(
                                    width: MediaQuery.of(context).size.width *
                                        _squareBottomLeftAnim.value /
                                        1200,
                                    height: MediaQuery.of(context).size.width *
                                        _squareBottomLeftAnim.value /
                                        1200,
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(245, 0, 0, 1),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(.5),
                                            blurRadius: 20.0,
                                            spreadRadius: 0.0,
                                            offset: Offset(
                                              5.0,
                                              5.0,
                                            ),
                                          )
                                        ]),
                                  ))
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.width * 0.3,
                    )
                  ],
                ),
              ),
            ),
            AnimatedBuilder(
              animation: _squareColorAnim,
              builder: (ctxc, chc) => Positioned(
                top: (_squareColorAnim.value) +
                    8 +
                    (MediaQuery.of(context).size.height * 0.5),
                left: (_squareColorAnim.value) +
                    4 +
                    MediaQuery.of(context).size.width * 0.5,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.width * 0.3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedBuilder(
                          animation: _squareBottomRightAnim,
                          builder: (ctx, ch) => RotationTransition(
                                turns: AlwaysStoppedAnimation(
                                    _squareColorAnim.value / 360),
                                child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        _squareBottomRightAnim.value /
                                        1200,
                                    height: MediaQuery.of(context).size.width *
                                        _squareBottomRightAnim.value /
                                        1200,
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(
                                            _squareColorAnim.value > 0
                                                ? 200 -
                                                    (_squareColorAnim.value * 1)
                                                        .toInt()
                                                : 245,
                                            _squareColorAnim.value > 0
                                                ? 200 -
                                                    (_squareColorAnim.value * 1)
                                                        .toInt()
                                                : 0,
                                            _squareColorAnim.value > 0
                                                ? 200 -
                                                    (_squareColorAnim.value * 1)
                                                        .toInt()
                                                : 0,
                                            1),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(.5),
                                            blurRadius: 20.0,
                                            spreadRadius: 0.0,
                                            offset: Offset(
                                              5.0,
                                              5.0,
                                            ),
                                          )
                                        ])),
                              ))
                    ],
                  ),
                ),
              ),
            )
          ],
        ));

  }

}
