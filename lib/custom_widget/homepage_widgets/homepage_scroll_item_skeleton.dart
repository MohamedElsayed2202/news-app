import 'package:flutter/material.dart';
import 'package:news_app/custom_widget/skeleton_container.dart';

class HomePageScrollItemSkeleton extends StatelessWidget {
  const HomePageScrollItemSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
          width: 230,
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  child: SkeletonContainer.square(
                    height: 130.0,
                    width: 229,
                  )
              ),
              SizedBox(
                height: 8.0,
              ),
              Padding(
                padding: EdgeInsets.only(right: 3.0),
                child: SkeletonContainer.rounded(width: 120, height: 20)
              ),
              SizedBox(
                height: 8.0,
              ),
             SkeletonContainer.rounded(width: 60, height: 20),
              SizedBox(
                height: 8.0,
              ),
              SkeletonContainer.rounded(width: 60, height: 20),
            ],
          )),
    );
  }
}
