import 'dart:math';

import 'package:dartz/dartz_unsafe.dart';
import 'package:ecommerce_app/bloc/category/category_bloc.dart';
import 'package:ecommerce_app/constants/asset.dart';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/data/repository/category_repository.dart';
import 'package:ecommerce_app/widgets/category_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/category.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    // context.read<CategoryBloc>().add(CategoryGetRequest());
    BlocProvider.of<CategoryBloc>(context).add(CategoryGetRequest());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Category>? catList;
    String? errorMessage;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 44, right: 44, top: 20),
                child: Container(
                  height: 46,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 16,
                      ),
                      Image.asset(Asset.appleIconBlue),
                      const Expanded(
                        child: Text(
                          'دسته بندی',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'SB',
                            fontSize: 16,
                            color: CustomColors.blue,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 30),
              sliver: BlocBuilder<CategoryBloc, CategoryState>(
                builder: (context, state) {
                  return SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      ((context, index) {
                        if (state is CategoryResponseInProgress) {
                          return CircularProgressIndicator();
                        }
                        if (state is CategoryResponseSuccess) {
                          state.response.fold(
                            (l) {
                              errorMessage = l;
                            },
                            (r) {
                              catList = r;
                            },
                          );
                          return CategoryCachedImage(
                            imageUrl: catList![index].thumbnail,
                          );
                        }
                        return Text('error');
                      }),
                      childCount: catList?.length ?? 8,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
