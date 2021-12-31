import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';
class SkeletonContainer extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius radius;
  const SkeletonContainer._({
    this.width = double.infinity,
    this.height = double.infinity,
    this.radius = const BorderRadius.all(Radius.circular(0)),
    Key? key
  }) : super(key: key);

  const SkeletonContainer.square({
    required double width,
    required double height,
    Key? key
  }) : this._(width:width,height: height, key:key);

  const SkeletonContainer.rounded({
    required double width,
    required double height,
    BorderRadius radius = const BorderRadius.all(Radius.circular(20)),
    Key? key
  }) : this._(width:width,height: height, radius: radius, key: key);

  @override
  Widget build(BuildContext context) {
    return SkeletonAnimation(
        child:Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.grey[300],
              borderRadius: radius
          ),
        )
    );
  }
}
