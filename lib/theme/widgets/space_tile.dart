import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:very_good_slide_puzzle/colors/colors.dart';

class SpaceTile extends StatefulWidget {
  const SpaceTile({Key? key}) : super(key: key);

  @override
  State<SpaceTile> createState() => _SpaceTileState();
}

class _SpaceTileState extends State<SpaceTile> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: PuzzleColors.grey5,
      highlightColor: PuzzleColors.grey6,
      direction: ShimmerDirection.ttb,
      period: const Duration(milliseconds: 300),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
