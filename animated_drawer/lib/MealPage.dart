import 'package:animated_drawer/Models/categories.dart';

import 'package:flutter/material.dart';

import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class MealPage extends StatefulWidget {
  const MealPage({super.key});

  @override
  State<MealPage> createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  final List<Categories> categorieslist = CategoriesList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 0.0,
        leading: MenuDrawer(),
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.symmetric(
              horizontal: 8,
            ),
            height: 20,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Location',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[400],
                  ),
                ),
                const Icon(
                  Icons.location_on,
                  size: 15,
                  color: Colors.black,
                )
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Good Morning! Ankit',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const Text(
                'Grab your ',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              const Text(
                'delicious meal!',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              searchFoodWidgets(context),
              const SizedBox(
                height: 20,
              ),
              moreWidget(context, "Explore Categories"),
              const SizedBox(
                height: 15,
              ),
              categoriesListViewWidget(context),
              const SizedBox(
                height: 15,
              ),
              moreWidget(context, "Most Popular"),
              const SizedBox(
                height: 15,
              ),
              mostPopularListView(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget mostPopularListView(BuildContext context) {
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: 4,
          itemBuilder: (context, index) {
            return Stack(children: [
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                height: 140,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.all(10),
                        height: 100,
                        width: 120,
                        color: Colors.yellow),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '5 Pepper',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const Text(
                            'Mixed Pizza',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                '\$120',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 20),
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.pink,
                                  size: 18,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 25,
                child: ClipPath(
                  clipper: RatingCurve(),
                  child: Container(
                    padding: const EdgeInsets.only(top: 8),
                    height: 50,
                    width: 40,
                    color: Colors.yellow,
                    child: const Column(
                      children: [
                        Icon(
                          Icons.star_outline,
                          size: 15,
                        ),
                        Text(
                          "4.5",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ]);
          }),
    );
  }

  Widget categoriesListViewWidget(BuildContext context) {
    return SizedBox(
      height: 120,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categorieslist.length,
          itemBuilder: (context, index) {
            final category = categorieslist[index];
            return Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.only(right: 10),
              width: 80,
              decoration: const BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(90),
                    bottom: Radius.circular(90),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      category.image,
                    ),
                    radius: 30,
                  ),
                  Text(
                    category.text,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            );
          }),
    );
  }
}

Widget moreWidget(BuildContext context, String text) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
      InkWell(
        onTap: () {},
        child: Icon(
          Icons.more_horiz,
          color: Colors.black,
        ),
      ),
    ],
  );
}

Widget searchFoodWidgets(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        height: 40,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: const TextField(
          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search),
              hintText: "Resturants, Foods ...",
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              enabled: false),
        ),
      ),
      Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Icon(Icons.tune, color: Colors.black),
      )
    ],
  );
}

class RatingCurve extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double width = size.width;
    double height = size.height;
    path.lineTo(0.0, height);
    path.quadraticBezierTo(width = 0.5, height = 50, width, height);
    path.lineTo(width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          ZoomDrawer.of(context)!.toggle();
        },
        icon: Icon(Icons.menu));
  }
}
