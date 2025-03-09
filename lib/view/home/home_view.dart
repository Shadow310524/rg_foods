import 'package:flutter/material.dart';
import 'package:rg_foods/common/color_extension.dart';
import 'package:rg_foods/common_widget/first_tile.dart';
import 'package:rg_foods/common_widget/most_popular.dart';
import 'package:rg_foods/common_widget/popular_restaurant.dart';
import 'package:rg_foods/common_widget/recent_items.dart';
import 'package:rg_foods/common_widget/round_textfield.dart';
import 'package:rg_foods/common_widget/view_all_tile.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController search_food = TextEditingController();
  List<Map<String, String>> resturants = [
    {"image": "assets/images/top1.png", "name": "Offers"},
    {"image": "assets/images/top2.png", "name": "Sri Lankan"},
    {"image": "assets/images/top3.png", "name": "Italian"},
    {"image": "assets/images/top4.png", "name": "Indian"},
    {"image": "assets/images/top1.png", "name": "Offers"},
    {"image": "assets/images/top2.png", "name": "Sri Lankan"},
    {"image": "assets/images/top3.png", "name": "Italian"},
    {"image": "assets/images/top4.png", "name": "Indian"},
  ];

  List<Map<String, dynamic>> popular_res = [
    {
      "image": "assets/images/pop1.png",
      "name": "Chettinad Restaurant",
      "rate": "4.5",
      "rating": "125",
      "type": "Cafe",
      "food_type": "Western Food",
    },
    {
      "image": "assets/images/pop2.png",
      "name": "Pandiyan Mess",
      "rate": "4.5",
      "rating": "125",
      "type": "Cafe",
      "food_type": "Western Food",
    },
    {
      "image": "assets/images/pop3.png",
      "name": "Kokkarakko",
      "rate": "4.5",
      "rating": "125",
      "type": "Cafe",
      "food_type": "Western Food",
    },
    // {
    //   "image": "assets/images/pop1.png",
    //   "name": "Thendral Mess",
    //   "rate": "4.5",
    //   "rating": "125",
    //   "type": "Cafe",
    //   "food_type": "Western Food",
    // },
  ];

  List<Map<String, dynamic>> most_popular = [
    {
      "image": "assets/images/mp1.png",
      "name": "Pizza",
      "rate": "4.5",
      "type": "Cafe",
      "food_type": "Western Food",
    },
    {
      "image": "assets/images/mp2.png",
      "name": "Capuccino",
      "rate": "4.5",
      "type": "Cafe",
      "food_type": "Western Food",
    },
  ];
  List<Map<String, dynamic>> recent_items = [
    {
      "image": "assets/images/ri1.png",
      "name": "Mulberry Pizza",
      "rate": "4.5",
      "rating": "125",
      "type": "Cafe",
      "food_type": "Western Food",
    },
    {
      "image": "assets/images/ri2.png",
      "name": "Heart Cafe",
      "rate": "4.5",
      "rating": "125",
      "type": "Cafe",
      "food_type": "Western Food",
    },
    {
      "image": "assets/images/ri3.png",
      "name": "Pizza Rush Hour",
      "rate": "4.5",
      "rating": "125",
      "type": "Cafe",
      "food_type": "Western Food",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Good morning Shadow!",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    // SizedBox(
                    //   width: 100,
                    // ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        "assets/images/shopping-cart.png",
                        width: 35,
                        height: 35,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Delivering to",
                  style: TextStyle(
                    color: Tcolor.secondaryText,
                    fontSize: 11,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Current Location",
                      style: TextStyle(
                          color: Tcolor.primaryText,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(width: 30),
                    Image.asset("assets/images/dropdown.png")
                  ],
                ),
              ),
              SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RoundTextfield(
                  hintText: "Search food",
                  controller: search_food,
                  left: Container(
                    width: 20,
                    child: Image.asset(
                      "assets/images/search.png",
                      width: 15,
                      height: 15,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 34),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: FirstTile(
                    restuarants: resturants,
                    onpressed: () {},
                  )),
              ViewAllTile(title: "Popular Restaurants", onpressed: () {}),
              SizedBox(height: 20),
              // Popular restaurant Section //
              PopularRestaurant(popular_restaurant: popular_res, ontap: () {}),
              ViewAllTile(title: "Most Popular", onpressed: () {}),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child:
                    MostPopular(most_popular: most_popular, onpressed: () {}),
              ),
              ViewAllTile(title: "Recent Items", onpressed: () {}),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child:
                    RecentItems(recent_items: recent_items, onpressed: () {}),
              )
            ],
          ),
        ),
      ),
    );
  }
}
