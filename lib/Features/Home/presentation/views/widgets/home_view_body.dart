import 'package:benta/Features/Cart/data/models/add_to_cart.dart';
import 'package:benta/Features/Cart/presentation/manager/add%20to%20cart%20cubit/add_to_cart_cubit.dart';
import 'package:benta/Features/Home/presentation/manager/categoryFilterCubit/category_filter_cubit.dart';
import 'package:benta/Features/Home/presentation/manager/cubit/get_item_cubit.dart';
import 'package:benta/Features/Home/presentation/views/widgets/home_app_bar.dart';
import 'package:benta/Features/Home/presentation/views/widgets/custom_item_container.dart';
import 'package:benta/Features/Home/presentation/views/widgets/custom_scroll_bar.dart';
import 'package:benta/Features/Home/presentation/views/widgets/custom_search_bar.dart';
import 'package:benta/Features/Home/presentation/views/widgets/custom_see_all.dart';
import 'package:benta/Features/Home/presentation/views/widgets/image_carusol.dart';
import 'package:benta/core/utils/api_services.dart';
import 'package:benta/core/utils/app_router.dart';
import 'package:benta/core/utils/constants.dart';
import 'package:benta/core/utils/shared_pref.dart';
import 'package:benta/core/utils/styles.dart';
import 'package:benta/core/utils/widgets/flushbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  Set<String> _favorites = {};

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  void _loadFavorites() {
    setState(() {
      _favorites = Set<String>.from(SharedPrefsHelper.getFavoriteItems());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40.h, left: 24.w, right: 24.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            HomeAppBar(),
            SizedBox(height: 25.h),
            Row(
              children: [
                IconButton(
                  icon: Icon(FontAwesome.bell),
                  color: kPrimaryColor,
                  onPressed: () {
                    context.push(AppRouter.kNotificationView);
                  },
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: CustomSearchBar(
                    controller: _searchController,
                    suffixIcon: Icons.mic_none,
                    customICon: Icons.camera_alt_outlined,
                    onSearchChanged: (query) {
                      setState(() {
                        _searchQuery = query.toLowerCase();
                      });
                    },
                    onSubmitted: (query) {
                      setState(() {
                        _searchQuery = query.toLowerCase();
                      });
                    },
                    onTap: () {
                      // context.push(AppRouter.kSearchView);
                    },
                  ),
                ),
                SizedBox(width: 10.w),
              ],
            ),
            SizedBox(height: 25.h),
            AutoMovingCarousel(),
            SizedBox(height: 30.h),
            CustomSeeAllWidget(
              title: 'Categories',
              onPressed: () {
                context.push(AppRouter.kAllProductsView);
              },
            ),
            SizedBox(height: 15.h),
            BlocProvider(
              create:
                  (_) =>
                      CategoryFilterCubit(ApiServices(Dio()))..getCategories(),
              child: const CategoryFilter(),
            ),
            SizedBox(height: 30.h),
            BlocConsumer<GetItemCubit, GetItemState>(
              listener: (context, state) {
                if (state is GetItemFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Failed to load items: ${state.errorMessage}',
                      ),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is GetItemLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is GetItemSuccess) {
                  final filteredItems =
                      _searchQuery.isEmpty
                          ? state.items
                          : state.items
                              .where(
                                (item) => item.name.toLowerCase().contains(
                                  _searchQuery,
                                ),
                              )
                              .toList();

                  if (filteredItems.isEmpty) {
                    return Center(
                      child: Text(
                        _searchQuery.isEmpty
                            ? 'Select a category'
                            : 'No results found for "$_searchQuery"',
                        style: Styles.style20,
                      ),
                    );
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (_searchQuery.isNotEmpty)
                        Padding(
                          padding: EdgeInsets.only(bottom: 15.h),
                          child: Text(
                            'Search results for "$_searchQuery"',
                            style: Styles.style16.copyWith(
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      SizedBox(
                        height: 192.h,
                        child: ListView.builder(
                          itemCount: filteredItems.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            final item = filteredItems[index];
                            return CustomItemContainer(
                              id: item.id,
                              title: item.name,
                              price: item.price.toString(),
                              rate: '4.5',
                              image:
                                  'assets/images/Helena-3S-Sofa-60-80K-9 1.png',
                              onFavoriteChanged: (isFavorite) async {
                                final itemId = item.id.toString();

                                setState(() {
                                  if (isFavorite) {
                                    _favorites.add(itemId);
                                    SharedPrefsHelper.addFavoriteItem(itemId);
                                  } else {
                                    _favorites.remove(itemId);
                                    SharedPrefsHelper.removeFavoriteItem(
                                      itemId,
                                    );
                                  }
                                });
                              },
                              isFavorite: _favorites.contains(
                                item.id.toString(),
                              ),

                              onAddToCart: () {
                                final userId = SharedPrefsHelper.getUserId();
                                if (userId != null) {
                                  context.read<AddToCartCubit>().addToCart(
                                    AddToCartModel(
                                      userId: userId,
                                      productId: item.id,
                                      quantity: 1,
                                    ),
                                  );

                                  showFlashbar(
                                    message: 'Item added Successfully!',
                                    backgroundColor: Colors.green,
                                    icon: Icons.check_circle,
                                  ).show(context);
                                }
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  );
                } else {
                  return Center(
                    child: Text('Select a category', style: Styles.style20),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
