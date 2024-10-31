import 'package:flutter/cupertino.dart';

class CategoriesCard extends StatelessWidget {
  final String title;
  final String image;
  final Color bgColor;
  const CategoriesCard({
    super.key,
    required this.title,
    required this.image,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
      child: Row(
        children: [
          Container(
            width: 136,
            height: 172,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: bgColor),
            child: Stack(
              children: [
                Positioned(
                  top: 10,
                  left: 16,
                  child: Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        fontFamily: 'Inter'),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 2,
                  child: Image(
                    image: AssetImage(image),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
