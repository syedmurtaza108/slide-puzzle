import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ProgressView extends StatelessWidget {
  const ProgressView({Key? key, required this.animationController})
      : super(key: key);

  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    final _firstHalfAnimation =
        Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.2, 0.4, curve: Curves.fastOutSlowIn),
      ),
    );
    final _secondHalfAnimation =
        Tween<Offset>(begin: Offset.zero, end: const Offset(-1, 0)).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.4, 0.6, curve: Curves.fastOutSlowIn),
      ),
    );
    final _relaxFirstHalfAnimation =
        Tween<Offset>(begin: const Offset(2, 0), end: Offset.zero).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.2, 0.4, curve: Curves.fastOutSlowIn),
      ),
    );
    final _relaxSecondHalfAnimation =
        Tween<Offset>(begin: Offset.zero, end: const Offset(-2, 0)).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.4, 0.6, curve: Curves.fastOutSlowIn),
      ),
    );

    final _imageFirstHalfAnimation =
        Tween<Offset>(begin: const Offset(4, 0), end: Offset.zero).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.2, 0.4, curve: Curves.fastOutSlowIn),
      ),
    );
    final _imageSecondHalfAnimation =
        Tween<Offset>(begin: Offset.zero, end: const Offset(-4, 0)).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.4, 0.6, curve: Curves.fastOutSlowIn),
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
              position: _relaxFirstHalfAnimation,
              child: SlideTransition(
                position: _relaxSecondHalfAnimation,
                child: const Text(
                  'Progress Check',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 64, vertical: 16),
              child: Text(
                'Keep check on your progress while playing',
                textAlign: TextAlign.center,
              ),
            ),
            SlideTransition(
              position: _imageFirstHalfAnimation,
              child: SlideTransition(
                position: _imageSecondHalfAnimation,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Lottie.asset(
                    'assets/animations/percentage.json',
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
