import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Staggered',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Staggered Animation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _iconButtonRotation;
  late Animation<double> _containerWidthAnimation;
  late Animation<double> _containerHeightAnimation;
  late Animation<double> _firstTileAnimation;
  late Animation<double> _secondTileAnimation;
  late Animation<double> _thirdTileAnimation;
  late Animation<double> _fourthTileAnimation;
  late Animation<double> _fifthTileAnimation;
  late Animation<Offset> _firstSlideAnimation;
  late Animation<Offset> _secondSlideAnimation;
  late Animation<Offset> _thirdSlideAnimation;
  late Animation<Offset> _fourthSlideAnimation;
  late Animation<Offset> _fifthSlideAnimation;
  // Tween<double> widthTween = Tween<double>(begin: 0.0, end: 200);
  // Tween<double> heightTween = Tween<double>(begin: 0.0, end: 200);
  CrossFadeState crossFadeMenuIconState = CrossFadeState.showFirst;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..addListener(
            () {
              setState(() {});
            },
          );
    _iconButtonRotation = Tween<double>(begin: 0.0, end: 2 * pi).animate(
        CurvedAnimation(
            parent: _animationController, curve: const Interval(0.0, 0.2)));
    // _firstTileAnimation = Tween<double>(begin: 0.0, end: 0.9).animate(
    //     CurvedAnimation(
    //         parent: _animationController, curve: const Interval(0.3, 0.44)));
    // _secondTileAnimation = Tween<double>(begin: 0.0, end: 0.9).animate(
    //     CurvedAnimation(
    //         parent: _animationController, curve: const Interval(0.44, 0.58)));
    // _thirdTileAnimation = Tween<double>(begin: 0.0, end: 0.9).animate(
    //     CurvedAnimation(
    //         parent: _animationController, curve: const Interval(0.58, 0.72)));
    // _fourthTileAnimation = Tween<double>(begin: 0.0, end: 0.9).animate(
    //     CurvedAnimation(
    //         parent: _animationController, curve: const Interval(0.72, 0.86)));
    // _fifthTileAnimation = Tween<double>(begin: 0.0, end: 0.9).animate(
    //     CurvedAnimation(
    //         parent: _animationController, curve: const Interval(0.86, 1.0)));

    _firstSlideAnimation =
        Tween<Offset>(begin: const Offset(2, 0), end: Offset.zero).animate(
            CurvedAnimation(
                parent: _animationController,
                curve: const Interval(0.2, 0.36)));
    _secondSlideAnimation =
        Tween<Offset>(begin: const Offset(2, 0), end: Offset.zero).animate(
            CurvedAnimation(
                parent: _animationController,
                curve: const Interval(0.36, 0.52)));
    _thirdSlideAnimation =
        Tween<Offset>(begin: const Offset(2, 0), end: Offset.zero).animate(
            CurvedAnimation(
                parent: _animationController,
                curve: const Interval(0.52, 0.68)));
    _fourthSlideAnimation =
        Tween<Offset>(begin: const Offset(2, 0), end: Offset.zero).animate(
            CurvedAnimation(
                parent: _animationController,
                curve: const Interval(0.68, 0.84)));
    _fifthSlideAnimation =
        Tween<Offset>(begin: const Offset(2, 0), end: Offset.zero).animate(
            CurvedAnimation(
                parent: _animationController,
                curve: const Interval(0.84, 1.0)));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  void onPressedMenuIcon() {
    if (_animationController.isCompleted) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }

    crossFadeMenuIconState = crossFadeMenuIconState == CrossFadeState.showFirst
        ? CrossFadeState.showSecond
        : CrossFadeState.showFirst;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    final Size(:width, :height) = size;
    // Tween<double> widthTween = Tween<double>(begin: 0.0, end: width * 0.8);
    // Tween<double> heightTween = Tween<double>(begin: 0.0, end: height * 0.6);
    // _containerWidthAnimation = widthTween.animate(CurvedAnimation(
    //     parent: _animationController,
    //     curve: const Interval(0.1, 0.3, curve: Curves.bounceOut)));
    // _containerHeightAnimation = heightTween.animate(CurvedAnimation(
    //     parent: _animationController,
    //     curve: const Interval(0.1, 0.3, curve: Curves.bounceOut)));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff143D60),
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          Transform.rotate(
              angle: _iconButtonRotation.value,
              child: IconButton(
                onPressed: onPressedMenuIcon,
                icon: AnimatedCrossFade(
                    firstChild: const Icon(
                      Icons.menu,
                    ),
                    secondChild: const Icon(
                      Icons.clear,
                    ),
                    crossFadeState: crossFadeMenuIconState,
                    duration: const Duration(milliseconds: 200)),
                style: const ButtonStyle(
                    iconColor: WidgetStatePropertyAll(Colors.white)),
              )),
        ],
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Container(
              width: width,
              height: height,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [const Color(0xff143D60), Colors.black],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SlideTransition(
                    position: _firstSlideAnimation,
                    child: Opacity(
                      opacity: 0.7,
                      child: Container(
                        width: width * 0.7,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                          child: ListTile(
                            leading: Icon(
                              Icons.home,
                              color: Colors.black,
                            ),
                            title: Text(
                              'Home',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SlideTransition(
                    position: _secondSlideAnimation,
                    child: Opacity(
                      opacity: 0.7,
                      child: Container(
                        width: width * 0.7,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                          child: ListTile(
                            leading: Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                            title: Text(
                              'Profile',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SlideTransition(
                    position: _thirdSlideAnimation,
                    child: Opacity(
                      opacity: 0.7,
                      child: Container(
                        width: width * 0.7,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                          child: ListTile(
                            leading: Icon(
                              Icons.share,
                              color: Colors.black,
                            ),
                            title: Text(
                              'Share',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SlideTransition(
                    position: _fourthSlideAnimation,
                    child: Opacity(
                      opacity: 0.7,
                      child: Container(
                        width: width * 0.7,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                          child: ListTile(
                            leading: Icon(
                              Icons.contact_mail,
                              color: Colors.black,
                            ),
                            title: Text(
                              'Contact us',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SlideTransition(
                    position: _fifthSlideAnimation,
                    child: Opacity(
                      opacity: 0.7,
                      child: Container(
                        width: width * 0.7,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                          child: ListTile(
                            leading: Icon(
                              Icons.info,
                              color: Colors.black,
                            ),
                            title: Text(
                              'About',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
