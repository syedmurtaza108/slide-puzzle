part of '../introduction_page.dart';

class NextView extends StatelessWidget {
  const NextView({
    Key? key,
    required this.animationController,
    required this.onNextClick,
  }) : super(key: key);

  final AnimationController animationController;
  final VoidCallback onNextClick;

  @override
  Widget build(BuildContext context) {
    final _topMoveAnimation =
        Tween<Offset>(begin: const Offset(0, 5), end: Offset.zero).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0, 0.2, curve: Curves.fastOutSlowIn),
      ),
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SlideTransition(
          position: _topMoveAnimation,
          child: AnimatedBuilder(
            animation: animationController,
            builder: (context, child) => AnimatedOpacity(
              opacity: animationController.value >= 0.2 &&
                      animationController.value <= 0.6
                  ? 1
                  : 0,
              duration: const Duration(milliseconds: 480),
              child: _pageView(),
            ),
          ),
        ),
        SlideTransition(
          position: _topMoveAnimation,
          child: Container(
            height: 58,
            width: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: const Color(0xff132137),
            ),
            child: InkWell(
              onTap: onNextClick,
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 64,
          width: MediaQuery.of(context).size.width,
        ),
      ],
    );
  }

  Widget _pageView() {
    var _selectedIndex = 0;

    if (animationController.value >= 0.5) {
      _selectedIndex = 2;
    } else if (animationController.value >= 0.3) {
      _selectedIndex = 1;
    } else if (animationController.value >= 0.1) {
      _selectedIndex = 0;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0; i < 3; i++)
            Padding(
              padding: const EdgeInsets.all(4),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 480),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: _selectedIndex == i
                      ? const Color(0xff132137)
                      : const Color(0xffE3E4E4),
                ),
                width: 10,
                height: 10,
              ),
            )
        ],
      ),
    );
  }
}
