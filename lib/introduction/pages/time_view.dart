import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TimeView extends StatelessWidget {
  const TimeView({
    Key? key,
    required this.animationController,
  }) : super(key: key);

  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    final _firstHalfAnimation =
        Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0, 0.2, curve: Curves.fastOutSlowIn),
      ),
    );
    final _secondHalfAnimation =
        Tween<Offset>(begin: Offset.zero, end: const Offset(-1, 0)).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.2, 0.4, curve: Curves.fastOutSlowIn),
      ),
    );
    final _textAnimation =
        Tween<Offset>(begin: Offset.zero, end: const Offset(-2, 0)).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.2, 0.4, curve: Curves.fastOutSlowIn),
      ),
    );
    final _imageAnimation =
        Tween<Offset>(begin: Offset.zero, end: const Offset(-4, 0)).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.2, 0.4, curve: Curves.fastOutSlowIn),
      ),
    );

    final _relaxAnimation =
        Tween<Offset>(begin: const Offset(0, -2), end: Offset.zero).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0, 0.2, curve: Curves.fastOutSlowIn),
      ),
    );
    return SlideTransition(
      position: _firstHalfAnimation,
      child: SlideTransition(
        position: _secondHalfAnimation,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideTransition(
              position: _relaxAnimation,
              child: const Text(
                'Limited Time',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ),
            SlideTransition(
              position: _textAnimation,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 64, vertical: 16),
                child: Text(
                  'You have only 10 minutes to complete your puzzle',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SlideTransition(
              position: _imageAnimation,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Lottie.asset(
                  'assets/animations/watch.json',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
