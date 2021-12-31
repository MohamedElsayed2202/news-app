import 'package:flutter/material.dart';
import 'package:news_app/custom_widget/skeleton_container.dart';

class LoadingArticlesList extends StatelessWidget {
  const LoadingArticlesList({Key? key,required this.itemCount}) : super(key: key);
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        padding: EdgeInsets.zero,
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: ListTile(
              leading: const ClipRRect(
                borderRadius:
                BorderRadius.all(Radius.circular(10)),
                child: SkeletonContainer.square(
                    height: 200, width: 50),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SkeletonContainer.rounded(
                      width: 200, height: 25),
                  SizedBox(
                    height: 5.0,
                  )
                ],
              ),
              subtitle: Row(
                children: const [
                  SkeletonContainer.rounded(
                      width: 100, height: 25),
                ],
              ),
            ),
          );
        });
  }
}
