import 'package:flutter/material.dart';

class HomePageScrollListItem extends StatelessWidget {
  const HomePageScrollListItem(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.publishedAt,
      required this.source,
      required this.onTap})
      : super(key: key);
  final String imageUrl;
  final String title;
  final String source;
  final String publishedAt;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        onTap: onTap,
        child: SizedBox(
            width: MediaQuery.of(context).size.width * .59,
            height: MediaQuery.of(context).size.height* .1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    child: imageUrl != 'images/image-not-found.png'
                        ? Image.network(
                            imageUrl,
                            fit: BoxFit.fill,
                            height: 130.0,
                            width: 229,errorBuilder: (context,object,trac){
                              return Image.asset(
                                'images/image-not-found.png',
                                fit: BoxFit.fill,
                                height: 130.0,
                                width: 229,
                              );
                    },
                          )
                        : Image.asset(
                            'images/image-not-found.png',
                            fit: BoxFit.fill,
                            height: 130.0,
                            width: 229,
                          )),
                const SizedBox(
                  height: 8.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 3.0),
                  child: Text(
                    title,
                    maxLines: 2,
                    style: const TextStyle(
                        fontSize: 14.0, fontWeight: FontWeight.w900),
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(publishedAt,
                    style: const TextStyle(color: Colors.grey, fontSize: 12.0)),
                const SizedBox(
                  height: 8.0,
                ),
                Text(source,
                    style: const TextStyle(color: Colors.grey, fontSize: 12.0))
              ],
            )),
      ),
    );
  }
}
