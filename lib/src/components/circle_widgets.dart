import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Story extends StatelessWidget {
  const Story({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Category(
            routeName: '/newsPage',
            categoryName: 'Economia',
            image: 'lib/src/assets/categoty_assets/money.jpg',
          ),
          Category(
              categoryName: 'educação',
              image: 'lib/src/assets/categoty_assets/book.jpg',
              routeName: '/newsPage'),
          Category(
              categoryName: 'sociedade',
              image: 'lib/src/assets/categoty_assets/people.jpg',
              routeName: '/newsPage'),
          Category(
              categoryName: 'segurança',
              image: 'lib/src/assets/categoty_assets/security.jpg',
              routeName: '/newsPage'),
          Category(
              categoryName: 'tecnologia',
              image: 'lib/src/assets/categoty_assets/light.jpg',
              routeName: '/newsPage'),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  late String categoryName;
  late String image;
  late String routeName;
  Category({
    required this.categoryName,
    required this.image,
    required this.routeName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(routeName);
      },
      child: Container(
        height: 80,
        child: Center(
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.red,
                backgroundImage: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ).image,
                maxRadius: 30,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                categoryName.toUpperCase(),
                style: TextStyle(
                  fontFamily: 'NanumGothic-Bold',
                  fontSize: 10,
                  color: const Color.fromARGB(255, 191, 6, 6),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
