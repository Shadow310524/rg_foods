import 'package:flutter/material.dart';
import 'package:rg_foods/common/color_extension.dart';
import 'package:rg_foods/common_widget/round_textfield.dart';
import 'package:rg_foods/view/menu/desserts_view.dart';

class MenuView extends StatefulWidget {
  const MenuView({super.key});

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  final TextEditingController search_food = TextEditingController();
  List<Map<String, dynamic>> menu_arr = [
    {
      "image": "assets/images/menu1.png",
      "quantity": "120",
      "food_type": "Food",
    },
    {
      "image": "assets/images/menu2.png",
      "quantity": "220",
      "food_type": "Beverages",
    },
    {
      "image": "assets/images/menu3.png",
      "quantity": "155",
      "food_type": "Desserts",
    },
    {
      "image": "assets/images/menu1.png",
      "quantity": "25",
      "food_type": "Promotions",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            margin: EdgeInsets.only(top: 140),
            width: size.width * 0.27,
            height: size.height * 0.6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  topRight: Radius.circular(40)),
              color: Tcolor.primary,
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Menu",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w500),
                        ),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
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
                  ListView.builder(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20, vertical: size.height * 0.08),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: menu_arr.length,
                      itemBuilder: (context, index) {
                        var menu = menu_arr[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DessertsView(menuObj: menu)));
                          },
                          child: Stack(
                            alignment: Alignment.centerRight,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    top: 8, bottom: 8, right: 20),
                                width: size.width - 100,
                                height: 100,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(40),
                                        bottomRight: Radius.circular(40),
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 8,
                                        offset: Offset(8, 8),
                                      )
                                    ]),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    menu["image"]!,
                                    height: 80,
                                    width: 80,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(width: 25),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          menu["food_type"]!,
                                          style: TextStyle(
                                              color: Tcolor.primaryText,
                                              fontSize: 22,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          "${menu["quantity"]} items",
                                          style: TextStyle(
                                              color: Tcolor.secondaryText,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 4,
                                            offset: Offset(0, 2),
                                          )
                                        ]),
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DessertsView(
                                                        menuObj: menu)));
                                      },
                                      icon: Icon(Icons.arrow_forward_ios),
                                      color: Tcolor.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
