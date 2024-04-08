import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_application/features/future_product/peresentation/bloc/category_cubit/category_cubit.dart';
import 'package:flutter_shopping_application/features/future_product/peresentation/bloc/category_cubit/category_state.dart';
import 'package:flutter_shopping_application/locator.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit(
        locator(),
      ),
      child: Builder(
        builder: (context) {
          ///call api
          BlocProvider.of<CategoryCubit>(context).LoadCategoryEvent();

          return BlocBuilder<CategoryCubit, CategoryState>(
            builder: (context, state) {
              return ListView(
                padding: const EdgeInsets.only(top: 20),
                children: [
                  GestureDetector(
                    onTap: () {
                      //  Navigator.pushNamed(context, AllProductsScreen.routeName, arguments: ProductsArguments(categoryId: categoryData.id!));
                    },
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 124, 170, 223),
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    "assets/images/Product_tanagolat.jpg",
                                    width: 60,
                                    height: 60,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  "تنقلات",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                  color: Color.fromARGB(255, 22, 35, 58),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      //  Navigator.pushNamed(context, AllProductsScreen.routeName, arguments: ProductsArguments(categoryId: categoryData.id!));
                    },
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 124, 170, 223),
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                "assets/images/Product_mive.jpg",
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              "میوه و سبزیجات",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: Color.fromARGB(255, 16, 21, 29),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      //  Navigator.pushNamed(context, AllProductsScreen.routeName, arguments: ProductsArguments(categoryId: categoryData.id!));
                    },
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 124, 170, 223),
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                "assets/images/Product_ajil.jpg",
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              "آجیل",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: Color.fromARGB(255, 16, 21, 29),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      //  Navigator.pushNamed(context, AllProductsScreen.routeName, arguments: ProductsArguments(categoryId: categoryData.id!));
                    },
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 124, 170, 223),
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                "assets/images/Product_labaniat.jpg",
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              "لبنیات و بستنی",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: Color.fromARGB(255, 16, 21, 29),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      //  Navigator.pushNamed(context, AllProductsScreen.routeName, arguments: ProductsArguments(categoryId: categoryData.id!));
                    },
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 124, 170, 223),
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                "assets/images/Product_nan.jpg",
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              "خواربار و نان",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: Color.fromARGB(255, 16, 21, 29),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      //  Navigator.pushNamed(context, AllProductsScreen.routeName, arguments: ProductsArguments(categoryId: categoryData.id!));
                    },
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 124, 170, 223),
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                "assets/images/Product_noshidani.jpg",
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              "نوشیدنی",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: Color.fromARGB(255, 16, 21, 29),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
