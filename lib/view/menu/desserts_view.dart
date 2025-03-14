import 'package:flutter/material.dart';
import 'package:rg_foods/common/color_extension.dart';
import 'package:rg_foods/common_widget/round_textfield.dart';
import 'package:rg_foods/view/menu/items_cart.dart';

class DessertsView extends StatefulWidget {
  const DessertsView({super.key, required Map<String, dynamic> menuObj});

  @override
  State<DessertsView> createState() => _DessertsViewState();
}

class _DessertsViewState extends State<DessertsView> {
  final TextEditingController search_food = TextEditingController();
  List<Map<String, dynamic>> dessert_arr = [
    {
      "image": "assets/images/des1.png",
      "name": "French Apple Pie",
      "rate": "4.5",
      "rating": "125",
      "type": "Minute by Tuk Tuk",
      "food_type": "Desserts",
      "description":
          "A classic French-inspired apple pie with a rich, buttery crust and a warm cinnamon-spiced apple filling. Topped with a golden crumble for the perfect crunch, this comforting dessert pairs beautifully with a scoop of vanilla ice cream or a drizzle of caramel sauce."
    },
    {
      "image": "assets/images/des2.png",
      "name": "Dark Chocolate Cake",
      "rate": "4.5",
      "rating": "125",
      "type": "Minute by Tuk Tuk",
      "food_type": "Desserts",
      "description":
          "A decadent, moist, and rich dark chocolate cake made from the finest cocoa. Layered with silky chocolate ganache and topped with a glossy glaze, this indulgent treat is perfect for true chocolate lovers who crave deep, intense flavors in every bite."
    },
    {
      "image": "assets/images/des3.png",
      "name": "Street Shake",
      "rate": "4.5",
      "rating": "125",
      "type": "Minute by Tuk Tuk",
      "food_type": "Desserts",
      "description":
          "A refreshing, thick, and creamy milkshake that captures the vibrant flavors of street-style beverages. Blended with premium chocolates, fresh fruits, and crunchy nuts, then topped with whipped cream and drizzled with sweet syrups, this shake is pure indulgence in a glass."
    },
    {
      "image": "assets/images/des4.png",
      "name": "Fudgy Chewy Brownies",
      "rate": "4.5",
      "rating": "125",
      "type": "Minute by Tuk Tuk",
      "food_type": "Desserts",
      "description":
          "Rich, gooey, and packed with intense chocolate flavor, these fudgy chewy brownies are a chocolate lover’s dream. Made with premium cocoa and real melted chocolate, each bite melts in your mouth with the perfect balance of chewiness and crisp edges."
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                      ),
                    ),
                    SizedBox(width: size.width * 0.01),
                    Text("Desserts",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Tcolor.primaryText)),
                    SizedBox(width: size.width * 0.430),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        "assets/images/shopping-cart.png",
                        width: 30,
                        height: 30,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: RoundTextfield(
                  left: Container(
                    child: Image.asset(
                      "assets/images/search.png",
                      width: 15,
                      height: 15,
                    ),
                  ),
                  hintText: "Search Food",
                  controller: search_food,
                ),
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: dessert_arr.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    var dessert_data = dessert_arr[index];
                    return GestureDetector(
                      onTap: () {
                        print("${dessert_data["image"]}");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ItemsCart(
                                    imageUrl: dessert_data["image"],
                                    name: dessert_data["name"],
                                    star: double.parse(dessert_data["rate"]),
                                    description: dessert_data["description"])));
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 5),
                        child: Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Image.asset(
                              dessert_data["image"]!,
                              width: double.infinity,
                              height: size.width * 0.5,
                              fit: BoxFit.cover,
                            ),
                            Container(
                              width: double.maxFinite,
                              height: 100,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.transparent,
                                      Colors.transparent,
                                      Colors.black
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter),
                              ),
                            ),
                            Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  child: Text(
                                    dessert_data["name"],
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Tcolor.white),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Tcolor.primary,
                                        size: 15,
                                      ),
                                      Text(
                                        dessert_data["rate"],
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Tcolor.white),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        dessert_data["type"],
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Tcolor.white),
                                      ),
                                      SizedBox(width: 10),
                                      Icon(
                                        Icons.circle,
                                        size: 5,
                                        color: Tcolor.primary,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        textAlign: TextAlign.center,
                                        dessert_data["food_type"],
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Tcolor.white),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
