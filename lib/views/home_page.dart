import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food/constants/helpers.dart';
import 'package:food/logic/providers/pizza_provider.dart';
import 'package:food/widgets/big_text_widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pizzas = ref.watch(pizzaProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              BigTextWidget(
                text: "Good food",
                color: Helpers.foodBlack87,
                size: 22,
              ),
              SizedBox(
                height: 10,
              ),
              BigTextWidget(
                text: "Fast delivery",
                color: Helpers.foodBlack87,
                size: 22,
              )
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 2, right: 2),
                  margin: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/food');
                        },
                        child: heroItems(
                            'https://cdn.pixabay.com/photo/2022/05/25/21/28/burger-7221436__340.jpg',
                            "Burger"),
                      ),
                      heroItems(
                          'https://cdn.pixabay.com/photo/2015/12/09/17/12/popcorn-1085072__340.jpg',
                          'Snacks'),
                      heroItems(
                          "https://cdn.pixabay.com/photo/2016/12/20/21/43/orange-1921548__340.jpg",
                          "Drinks"),
                      heroItems(
                          "https://cdn.pixabay.com/photo/2017/01/10/19/05/watermelon-1969949__340.jpg",
                          "Dessert")
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 2, right: 2),
                  margin: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      heroItems(
                          'https://cdn.pixabay.com/photo/2014/04/17/05/18/namdaemun-market-326146__340.jpg',
                          "Vegetables"),
                      heroItems(
                          'https://cdn.pixabay.com/photo/2018/01/01/17/57/fish-soup-3054627__340.jpg',
                          'Noodles'),
                      heroItems(
                          "https://cdn.pixabay.com/photo/2016/09/26/17/52/goulash-1696569__340.jpg",
                          "Sea food"),
                      heroItems(
                          "https://cdn.pixabay.com/photo/2014/07/15/19/04/fried-394171__340.jpg",
                          "Eggs")
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: BigTextWidget(
                    text: "Top of the week",
                    color: Helpers.foodorange600,
                    size: 18,
                  ),
                ),
                pizzas.when(
                  data: (data) {
                    return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: data.length,
                        itemBuilder: ((context, index) {
                          return Row(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: NetworkImage(data[index].img!))),
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 10),
                                child: Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    BigTextWidget(
                                      text: data[index].name!,
                                      color: Helpers.foodBlack87,
                                    ),
                                    BigTextWidget(
                                      text: data[index]
                                          .description!
                                          .substring(0, 6),
                                      color: Helpers.foodBlack45,
                                      size: 14,
                                    ),
                                    BigTextWidget(
                                      text: 'Ksh.${data[index].price!}',
                                      color: Helpers.foodorange800,
                                    )
                                  ],
                                )),
                              )
                            ],
                          );
                        }));
                  },
                  error: (err, stack) => Text('Error: $err'),
                  loading: () => const CircularProgressIndicator(),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Column heroItems(String url, String text) {
    return Column(
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
          ),
        ),
        BigTextWidget(
          text: text,
          size: 18,
          color: Helpers.foodBlack45,
        )
      ],
    );
  }
}
