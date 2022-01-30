import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroView extends StatefulWidget {
  const IntroView({
    Key? key,
    required this.animationController,
  }) : super(key: key);
  final AnimationController animationController;

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  @override
  Widget build(BuildContext context) {
    final _introductionanimation =
        Tween<Offset>(begin: Offset.zero, end: const Offset(0, -1)).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: const Interval(0, 0.2, curve: Curves.fastOutSlowIn),
      ),
    );
    return SlideTransition(
      position: _introductionanimation,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Lottie.asset(
              'assets/animations/intro1.json',
              fit: BoxFit.cover,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'Puzzle Challenge',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 64),
            child: Text(
              'Do you want to improve your memory?\nPlay the game cleverly.',
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 48),
          InkWell(
            onTap: () {
              widget.animationController.animateTo(0.2);
            },
            child: Container(
              height: 58,
              padding: const EdgeInsets.symmetric(horizontal: 56, vertical: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(38),
                color: const Color(0xff132137),
              ),
              child: const Text(
                "Let's play",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
