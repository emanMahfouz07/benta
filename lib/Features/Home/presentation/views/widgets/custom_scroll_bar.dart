import 'package:benta/Features/Home/data/models/categoty_model.dart';
import 'package:benta/Features/Home/presentation/manager/categoryFilterCubit/category_filter_cubit_cubit.dart';
import 'package:benta/Features/Home/presentation/manager/cubit/get_item_cubit.dart';
import 'package:benta/core/utils/constants.dart';
import 'package:benta/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryFilter extends StatefulWidget {
  const CategoryFilter({super.key});

  @override
  State<CategoryFilter> createState() => _CategoryFilterState();
}

class _CategoryFilterState extends State<CategoryFilter> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      child: BlocBuilder<CategoryFilterCubit, CategoryFilterState>(
        builder: (context, state) {
          if (state is CategoryFilterLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CategoryFilterSuccess) {
            final categories = [CategoryModel("All"), ...state.categories];

            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final isSelected = selectedIndex == index;

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });

                      final selectedCategory = categories[index].name;
                      print(
                        "Category selected: $selectedCategory",
                      ); // Debug print
                      context.read<GetItemCubit>().getItemsByCategory(
                        selectedCategory,
                      );
                    },

                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 14.w,
                        vertical: 8.h,
                      ),
                      decoration: BoxDecoration(
                        color:
                            isSelected
                                ? kPrimaryColor
                                : const Color(0xffF1F4F4),
                        borderRadius: BorderRadius.circular(100.r),
                        border:
                            isSelected
                                ? null
                                : Border.all(color: kPrimaryColor),
                      ),
                      child: Text(
                        categories[index].name,
                        style: Styles.style14.copyWith(
                          color: isSelected ? Colors.white : kPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (state is CategoryFilterFailure) {
            return Center(child: Text("Error: ${state.error}"));
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
