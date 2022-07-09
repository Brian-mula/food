import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food/constants/helpers.dart';
import 'package:food/widgets/big_text_widget.dart';
import 'package:food/widgets/custom_text_input.dart';

class FoodPage extends ConsumerStatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FoodPageState();
}

class _FoodPageState extends ConsumerState<FoodPage> {
  int tabIndex = 0;
  final TextEditingController searchController = TextEditingController();

  List<String> categories = [
    'Snacks',
    'Burger',
    'Drinks',
    'Dessert',
    'Veges',
    "Sea food",
    'Noodles',
    'Eggs',
    'Fries',
    'Roasted'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 70, right: 10, left: 10),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // !search input
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: CustomTextInput(
                    controller: searchController,
                    icon: Icons.search,
                    labelText: "Search in store"),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: const BigTextWidget(text: "Shop by Categories"),
              ),
              // !list of categories
              Container(
                height: 50,
                margin: const EdgeInsets.only(top: 10),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            tabIndex = index;
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 80,
                          margin: const EdgeInsets.only(
                            left: 10,
                          ),
                          decoration: BoxDecoration(
                              color: tabIndex == index
                                  ? Helpers.foodgreen700
                                  : Helpers.foodgrey700,
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: BigTextWidget(
                              text: categories[index],
                              color: tabIndex == index
                                  ? Helpers.foodWhite
                                  : Helpers.foodBlack45,
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              // !available eats
              Container(
                margin: const EdgeInsets.only(
                  top: 30,
                ),
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: const BigTextWidget(
                  text: "Available Eats",
                  color: Helpers.foodBlack54,
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 490,
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                  child: GridView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: 10,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return Card(
                          child: Container(
                            height: 210,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Wrap(
                              alignment: WrapAlignment.start,
                              children: [
                                Container(
                                  height: 100,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      image: const DecorationImage(
                                          image: NetworkImage(
                                              'https://images.unsplash.com/photo-1610440042657-612c34d95e9f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGJ1cmdlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
                                          fit: BoxFit.cover)),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                      top: 5, left: 10, right: 10),
                                  child: const BigTextWidget(
                                    text: "Burger",
                                    size: 16,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: const BigTextWidget(
                                        text: "Ksh. 1200",
                                        color: Helpers.foodBlack54,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(right: 4),
                                      child: Icon(
                                        Icons.add_shopping_cart,
                                        color: Helpers.foodorange600,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
