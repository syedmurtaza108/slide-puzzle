part of '../introduction_page.dart';

class BackView extends StatelessWidget {
  const BackView({
    Key? key,
    required this.onBackClick,
    required this.onSkipClick,
    required this.animationController,
  }) : super(key: key);

  final AnimationController animationController;
  final VoidCallback onBackClick;
  final VoidCallback onSkipClick;

  @override
  Widget build(BuildContext context) {
    final _animation =
        Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0, 0.2, curve: Curves.fastOutSlowIn),
      ),
    );

    final _skipAnimation =
        Tween<Offset>(begin: Offset.zero, end: const Offset(2, 0)).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.6, 0.8, curve: Curves.fastOutSlowIn),
      ),
    );

    return SlideTransition(
      position: _animation,
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: SizedBox(
          height: 58,
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: onBackClick,
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                ),
                SlideTransition(
                  position: _skipAnimation,
                  child: IconButton(
                    onPressed: onSkipClick,
                    icon: const Text('Skip'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
