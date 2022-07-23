import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food/constants/helpers.dart';
import 'package:food/logic/models/foods.dart';
import 'package:food/logic/providers/pizza_provider.dart';
import 'package:food/logic/store/store.dart';
import 'package:food/widgets/big_text_widget.dart';

class PizzaPage extends ConsumerWidget {
  const PizzaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args = ModalRoute.of(context)!.settings.arguments as FoodModel;
    Store store = Store();
    final stores = ref.watch(storeProvider);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
        child: Column(
          children: [
            // !top navigation section
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/');
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      size: 24,
                      color: Helpers.foodBlack54,
                    ),
                  ),
                  const Icon(
                    Icons.favorite,
                    size: 24,
                    color: Helpers.foodBlack54,
                  ),
                ],
              ),
            ),
            // !image section
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
              margin: const EdgeInsets.only(top: 50, left: 10, right: 10),
              height: 300,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Helpers.foodgreen700,
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                      image: NetworkImage(args.img!), fit: BoxFit.cover)),
            ),
            // !underscore section
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: 3,
              width: 60,
              color: Helpers.foodBlack38,
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              margin: const EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  // !food title section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BigTextWidget(
                        text: args.name!,
                        size: 18,
                        color: Helpers.foodBlack45,
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            child: GestureDetector(
                              onTap: () {
                                stores.setQuantity(false);
                              },
                              child: const Icon(
                                Icons.remove,
                                size: 20,
                                color: Helpers.foodBlack45,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            child: BigTextWidget(
                              text: stores.quantity.toString(),
                              color: Helpers.foodBlack87,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              stores.setQuantity(true);
                            },
                            child: const Icon(
                              Icons.add,
                              size: 20,
                              color: Helpers.foodBlack54,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const BigTextWidget(
                              text: "Size",
                              color: Helpers.foodBlack45,
                            ),
                            const SizedBox(height: 7),
                            BigTextWidget(
                              text: "Medium",
                              color: Helpers.foodorange600,
                            )
                          ],
                        ),
                        Column(
                          children: [
                            const BigTextWidget(
                              text: "Calories",
                              color: Helpers.foodBlack45,
                            ),
                            const SizedBox(height: 7),
                            BigTextWidget(
                              text: "20 kols",
                              color: Helpers.foodorange600,
                            )
                          ],
                        ),
                        Column(
                          children: [
                            const BigTextWidget(
                              text: "Cooking",
                              color: Helpers.foodBlack45,
                            ),
                            const SizedBox(height: 7),
                            BigTextWidget(
                              text: "10-30 mins",
                              color: Helpers.foodorange600,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: BigTextWidget(text: args.description!),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BigTextWidget(
                            text: "Ksh. 250",
                            color: Helpers.foodorange600,
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 5, left: 5),
                            height: 40,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Helpers.foodorange600,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Center(
                              child: BigTextWidget(
                                text: "CheckOut",
                                color: Helpers.foodWhite,
                                size: 20,
                              ),
                            ),
                          )
                        ],
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
