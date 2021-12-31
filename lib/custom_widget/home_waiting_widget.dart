import 'package:flutter/material.dart';
import 'package:news_app/custom_widget/skeleton_container.dart';

import 'homepage_widgets/homepage_scroll_item_skeleton.dart';

class HomeWaiting extends StatelessWidget {
  const HomeWaiting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
          ),
          height: MediaQuery.of(context).size.height * .45,
          child: Stack(
            fit: StackFit.expand,
            children: [
              ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0)),
                  child: SkeletonContainer.square(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .45)),
              const Positioned(
                top: 140.0,
                left: 30.0,
                child: SkeletonContainer.rounded(width: 100, height: 25),
              ),
              Positioned(
                top: 190,
                left: 30.0,
                right: 50.0,
                child: SkeletonContainer.rounded(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 40,
                ),
              ),
              const Positioned(
                bottom: 30.0,
                left: 30.0,
                child: SkeletonContainer.rounded(width: 100, height: 25),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Breaking News',
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w900),
              ),
              Text('More',
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold))
            ],
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return const HomePageScrollItemSkeleton();
            },
            itemCount: 2,
            scrollDirection: Axis.horizontal,
          ),
        ))
      ],
    );
  }
}
