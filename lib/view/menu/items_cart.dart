import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:rg_foods/common/color_extension.dart';
import 'package:rg_foods/common_widget/bottom_icon.dart';
import 'package:rg_foods/common_widget/round_button.dart';

class ItemsCart extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String description;
  final double star;

  const ItemsCart(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.star,
      required this.description});

  @override
  State<ItemsCart> createState() => _ItemsCartState();
}

class _ItemsCartState extends State<ItemsCart> {
  List<String> dropdownItems = ["Small", "Medium", "Large"];
  String? selectedSize;
  String? selectedIngredients;
  int qty = 1;
  bool isFavourite = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print(widget.star);
    print(size.width);
    print(171 / size.width);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Image.asset(
                  widget.imageUrl,
                  width: size.width,
                  height: size.width,
                  fit: BoxFit.cover,
                ),
                Container(
                  width: size.width,
                  height: size.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.black,
                    Colors.transparent,
                    Colors.black
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.width - 60,
                      ),
                      Container(
                        width: size.width,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Tcolor.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50))),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.name,
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RatingBarIndicator(
                                  rating: widget.star,
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star,
                                    color: Tcolor.primary,
                                  ),
                                  itemCount: 5,
                                  itemSize: 20,
                                ),
                              ],
                            ),
                            SizedBox(height: 2),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${widget.star} star Ratings",
                                  style: TextStyle(
                                      color: Tcolor.primary,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "Rs. 750",
                                  style: TextStyle(
                                      color: Tcolor.primaryText,
                                      fontSize: 31,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "/ per Portion",
                                  style: TextStyle(
                                      color: Tcolor.primaryText,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Text(
                              "Description",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 05),
                            Text(
                              widget.description,
                              style: TextStyle(
                                color: Tcolor.primaryText,
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                            SizedBox(width: 10),
                            Divider(
                              thickness: 1,
                              color: Tcolor.placeholder,
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Customize your Order",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 5),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: DropdownButtonFormField<String>(
                                value: selectedSize,
                                decoration: InputDecoration(
                                    fillColor: Colors.grey[200],
                                    filled: true,
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(
                                      left: 30,
                                    ),
                                    hintText: "- Select the size of portion -"),
                                items: dropdownItems.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(), // Converts Iterable to List
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedSize =
                                        newValue; // Update selected value
                                  });
                                },
                                isExpanded: true,
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: DropdownButtonFormField<String>(
                                value: selectedIngredients,
                                decoration: InputDecoration(
                                    fillColor: Colors.grey[200],
                                    filled: true,
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(
                                      left: 30,
                                    ),
                                    hintText: "- Select the ingredients -"),
                                items: dropdownItems.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(), // Converts Iterable to List
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedIngredients =
                                        newValue; // Update selected value
                                  });
                                },
                                isExpanded: true,
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Number of Portions",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700),
                                ),
                                // SizedBox(
                                //   width: 10,
                                // ),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    if (qty > 1) {
                                      setState(() {
                                        qty--;
                                      });
                                    }
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 40,
                                    height: 25,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Tcolor.primary),
                                    child: Text(
                                      "-",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Tcolor.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: 40,
                                  height: 25,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Tcolor.white,
                                      border: Border.all(
                                          color: Tcolor.primary, width: 1)),
                                  child: Text(
                                    "$qty",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Tcolor.primary,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      qty++;
                                    });
                                    print(qty);
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 40,
                                    height: 25,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Tcolor.primary),
                                    child: Text(
                                      "+",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Tcolor.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 70),
                            Stack(
                              alignment: Alignment.center,
                              clipBehavior: Clip.none,
                              children: [
                                Positioned(
                                  left: -20,
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: size.width * 0.23,
                                    height: size.width * 0.45,
                                    decoration: BoxDecoration(
                                        color: Tcolor.primary,
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(35),
                                          bottomLeft: Radius.circular(20),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 8,
                                              color: Colors.black12,
                                              offset: Offset(0, 4))
                                        ]),
                                  ),
                                ),
                                Positioned(
                                  left: size.width * 0.09,
                                  child: Container(
                                    width: size.width * 0.77,
                                    height: size.width * 0.34,
                                    decoration: BoxDecoration(
                                        color: Tcolor.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(50),
                                          topRight: Radius.circular(25),
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(50),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 8,
                                              color: Colors.black12,
                                              offset: Offset(0, 3))
                                        ]),
                                  ),
                                ),
                                Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Total Price",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "Rs.${qty * 750}",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      SizedBox(height: 10),
                                      InkWell(
                                        onTap: () {
                                          print("working");
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 200,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 30),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Tcolor.primary,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                "assets/images/shopping-cart.png",
                                                width: 20,
                                                height: 20,
                                                color: Tcolor.white,
                                              ),
                                              SizedBox(width: 10),
                                              Text(
                                                "Add to Cart",
                                                style: TextStyle(
                                                    color: Tcolor.white,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Positioned(
                                  right: size.width * 0.001,
                                  top: size.width * 0.085,
                                  child: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          color: Tcolor.white,
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 4,
                                                color: Colors.black12,
                                                offset: Offset(0, 2))
                                          ]),
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: Image.asset(
                                          "assets/images/shopping-cart.png",
                                          width: 25,
                                          height: 25,
                                          color: Tcolor.primary,
                                        ),
                                      )),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 20,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Tcolor.white,
                    ),
                  ),
                ),
                Positioned(
                    top: size.width - 50,
                    left: size.width * 0.88,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isFavourite = !isFavourite;
                        });
                      },
                      child: (Icon(
                        Icons.favorite,
                        color: isFavourite ? Tcolor.primary : Colors.grey,
                      )),
                    )),
                Positioned(
                  top: 30,
                  right: 20,
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      "assets/images/shopping-cart.png",
                      width: 30,
                      height: 30,
                      fit: BoxFit.contain,
                      color: Tcolor.white,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 70,
            )
          ],
        ),
      ),
    );
  }
}
