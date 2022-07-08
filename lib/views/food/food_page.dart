import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food/constants/helpers.dart';
import 'package:food/widgets/big_text_widget.dart';
import 'package:food/widgets/custom_text_input.dart';

class FoodPage extends ConsumerWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController searchController = TextEditingController();
    final tabIndex = 0;

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
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
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
                            text: "Snacks",
                            color: tabIndex == index
                                ? Helpers.foodWhite
                                : Helpers.foodBlack45,
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
