import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationView extends StatelessWidget {
  const AnimationView({Key? key, required this.animationController})
      : super(key: key);
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    final _firstHalfAnimation =
        Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.4, 0.6, curve: Curves.fastOutSlowIn),
      ),
    );
    final _secondHalfAnimation =
        Tween<Offset>(begin: Offset.zero, end: const Offset(-1, 0)).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.6, 0.8, curve: Curves.fastOutSlowIn),
      ),
    );

    final _moodFirstHalfAnimation =
        Tween<Offset>(begin: const Offset(2, 0), end: Offset.zero).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.4, 0.6, curve: Curves.fastOutSlowIn),
      ),
    );
    final _moodSecondHalfAnimation =
        Tween<Offset>(begin: Offset.zero, end: const Offset(-2, 0)).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.6, 0.8, curve: Curves.fastOutSlowIn),
      ),
    );
    final _imageFirstHalfAnimation =
        Tween<Offset>(begin: const Offset(4, 0), end: Offset.zero).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.4, 0.6, curve: Curves.fastOutSlowIn),
      ),
    );
    final _imageSecondHalfAnimation =
        Tween<Offset>(begin: Offset.zero, end: const Offset(-4, 0)).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.6, 0.8, curve: Curves.fastOutSlowIn),
      ),
    );

    return SlideTransition(
      position: _firstHalfAnimation,
      child: SlideTransition(
        position: _secondHalfAnimation,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Beautiful Animations',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SlideTransition(
              position: _moodFirstHalfAnimation,
              child: SlideTransition(
                position: _moodSecondHalfAnimation,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 64, vertical: 16),
                  child: Text(
                    'Keep your brain calm, enjoying aesthetic animations',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            SlideTransition(
              position: _imageFirstHalfAnimation,
              child: SlideTransition(
                position: _imageSecondHalfAnimation,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Lottie.asset(
                    'assets/animations/animation.json',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
