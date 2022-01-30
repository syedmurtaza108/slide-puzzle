import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:very_good_slide_puzzle/colors/colors.dart';
import 'package:very_good_slide_puzzle/layout/layout.dart';
import 'package:very_good_slide_puzzle/models/models.dart';
import 'package:very_good_slide_puzzle/puzzle/puzzle.dart';
import 'package:very_good_slide_puzzle/theme/theme.dart';
import 'package:very_good_slide_puzzle/timer/timer.dart';

/// {@template puzzle_page}
/// The root page of the puzzle UI.
///
/// Builds the puzzle based on the current [PuzzleTheme]
/// from [ThemeBloc].
/// {@endtemplate}
class PuzzlePage extends StatelessWidget {
  /// {@macro puzzle_page}
  const PuzzlePage({Key? key}) : super(key: key);

  static const route = 'puzzle';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(
        themes: const [
          SimpleTheme(),
        ],
      ),
      child: const PuzzleView(),
    );
  }
}

/// {@template puzzle_view}
/// Displays the content for the [PuzzlePage].
/// {@endtemplate}
class PuzzleView extends StatelessWidget {
  /// {@macro puzzle_view}
  const PuzzleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);

    /// Shuffle only if the current theme is Simple.
    final shufflePuzzle = theme is SimpleTheme;

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: BlocProvider(
        create: (context) => TimerBloc(
          ticker: const Ticker(),
        ),
        child: BlocProvider(
          create: (context) => PuzzleBloc(4)
            ..add(
              PuzzleInitialized(
                shufflePuzzle: shufflePuzzle,
              ),
            ),
          child: const _Puzzle(
            key: Key('puzzle_view_puzzle'),
          ),
        ),
      ),
    );
  }
}

class _Puzzle extends StatefulWidget {
  const _Puzzle({Key? key}) : super(key: key);

  @override
  State<_Puzzle> createState() => __PuzzleState();
}

class __PuzzleState extends State<_Puzzle> with TickerProviderStateMixin {
  AnimationController? animationController;

  @override
  void initState() {
    animationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);
    final state = context.select((PuzzleBloc bloc) => bloc.state);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: theme.layoutDelegate.backgroundBuilder(state),
            ),
            SafeArea(
              child: Align(
                alignment: Alignment.topCenter,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const CircularProgressIndicator(
                      color: PuzzleColors.primary1,
                    ),
                    Lottie.asset(
                      'assets/animations/squid_game.json',
                      fit: BoxFit.cover,
                      height: 300,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 300),
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minHeight: 300,
                  ),
                  child: const _PuzzleSections(
                    key: Key('puzzle_sections'),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

// ignore: unused_element
class _PuzzleHeader extends StatelessWidget {
  const _PuzzleHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      child: ResponsiveLayoutBuilder(
        small: (context, child) => const Center(
          child: _PuzzleLogo(),
        ),
        medium: (context, child) => Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 50,
          ),
          child: Row(
            children: const [
              _PuzzleLogo(),
            ],
          ),
        ),
        large: (context, child) => Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 50,
          ),
          child: Row(
            children: const [
              _PuzzleLogo(),
            ],
          ),
        ),
      ),
    );
  }
}

class _PuzzleLogo extends StatelessWidget {
  const _PuzzleLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
      small: (context, child) => const SizedBox(
        height: 24,
        child: FlutterLogo(
          style: FlutterLogoStyle.horizontal,
          size: 86,
        ),
      ),
      medium: (context, child) => const SizedBox(
        height: 29,
        child: FlutterLogo(
          style: FlutterLogoStyle.horizontal,
          size: 104,
        ),
      ),
      large: (context, child) => const SizedBox(
        height: 32,
        child: FlutterLogo(
          style: FlutterLogoStyle.horizontal,
          size: 114,
        ),
      ),
    );
  }
}

class _PuzzleSections extends StatelessWidget {
  const _PuzzleSections({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);
    final state = context.select((PuzzleBloc bloc) => bloc.state);

    return ResponsiveLayoutBuilder(
      small: (context, child) => Column(
        children: [
          // theme.layoutDelegate.startSectionBuilder(state),
          const PuzzleBoard(),
          theme.layoutDelegate.endSectionBuilder(state),
        ],
      ),
      medium: (context, child) => Column(
        children: [
          // theme.layoutDelegate.startSectionBuilder(state),
          const PuzzleBoard(),
          theme.layoutDelegate.endSectionBuilder(state),
        ],
      ),
      large: (context, child) => Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: theme.layoutDelegate.startSectionBuilder(state),
          ),
          const PuzzleBoard(),
          Expanded(
            child: theme.layoutDelegate.endSectionBuilder(state),
          ),
        ],
      ),
    );
  }
}

class PuzzleBoard extends StatefulWidget {
  const PuzzleBoard({Key? key}) : super(key: key);

  @override
  State<PuzzleBoard> createState() => _PuzzleBoardState();
}

class _PuzzleBoardState extends State<PuzzleBoard>
    with TickerProviderStateMixin {
  late final AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);
    final puzzle = context.select((PuzzleBloc bloc) => bloc.state.puzzle);

    final size = puzzle.getDimension();
    if (size == 0) return const CircularProgressIndicator();

    return BlocListener<PuzzleBloc, PuzzleState>(
      listener: (context, state) {
        if (theme.hasTimer && state.puzzleStatus == PuzzleStatus.complete) {
          context.read<TimerBloc>().add(const TimerStopped());
        }
      },
      child: theme.layoutDelegate.boardBuilder(
        size,
        List<Widget>.generate(
          size * size,
          (int index) {
            final animation = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: animationController,
                curve: Interval(
                  (1 / (size * size)) * index,
                  1,
                  curve: Curves.fastOutSlowIn,
                ),
              ),
            );
            animationController.forward();
            final tile = puzzle.tiles[index];
            return _PuzzleTile(
              key: Key('puzzle_tile_${tile.value.toString()}'),
              tile: tile,
              animation: animation,
              animationController: animationController,
            );
          },
        ),
      ),
    );
  }
}

class _PuzzleTile extends StatelessWidget {
  const _PuzzleTile({
    required this.tile,
    required this.animation,
    required this.animationController,
    Key? key,
  }) : super(key: key);

  /// The tile to be displayed.
  final Tile tile;

  final AnimationController animationController;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);
    final state = context.select((PuzzleBloc bloc) => bloc.state);

    return tile.isWhitespace
        ? theme.layoutDelegate.whitespaceTileBuilder()
        : theme.layoutDelegate.tileBuilder(
            tile,
            state,
            animationController,
            animation,
          );
  }
}
