import 'package:carousel_slider/carousel_slider.dart';
import 'package:coffee/data/local/local_database.dart';
import 'package:coffee/screens/widgets/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../produkt_model/product_model.dart';
import '../utils/colors/app_colors.dart';
import '../utils/images/app_images.dart';
import '../utils/size/size_utils.dart';
import 'favori_screen/fovorit_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int activeCategory = 0;
  final scaffoldKey = GlobalKey<ScaffoldState>();



  List<CoffeeModels> dataBase = [
    CoffeeModels(title: "Mocha", image: AppImages.mocha, subtitle: "very best", count: 0, price: '20'),
    CoffeeModels(title: "Mocha", image: AppImages.mocha, subtitle: "very best", count: 0, price: "30"),
    CoffeeModels(title: "Cappucino", image: AppImages.cappucino, subtitle: "very best", count: 0, price: '35'),
    CoffeeModels(title: "Espresso", image: AppImages.coffee1, subtitle: "very best", count: 0, price: '18'),
    CoffeeModels(title: "Espresso", image: AppImages.coffee2, subtitle: "very best", count: 0, price: '25'),
    CoffeeModels(title: "Latte", image: AppImages.latte, subtitle: "very best", count: 0, price: '32'),
    CoffeeModels(title: "Cappucino", image: AppImages.coffee3, subtitle: "very best", count: 0, price: '27'),
    CoffeeModels(title: "Espresso", image: AppImages.coffee4, subtitle: "very best", count: 0, price: '39'),
  ];



  @override
  Widget build(BuildContext context) {
    List<CoffeeModels> categoryDatabase = dataBase;

    return Scaffold(
      backgroundColor: AppColors.c_0C0F14,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
          },
          icon: Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon:  Icon(Icons.search),
          ),
          8.getW(),
          IconButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const FavouriteScreen(),
              //   ),
              // );
            },
            icon: SvgPicture.asset(AppImages.heart),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.getH(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              "your_favorites",
              style: TextStyle(
                color: AppColors.white,
                fontSize: 30.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          16.getH(),
          CarouselSlider(
            items: List.generate(
              dataBase.length,
                  (index) => ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.white.withOpacity(.05),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const InfoCoffeeScreen(),
                  //   ),
                  // );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    8.getH(),
                    Image.asset(dataBase[index].image),
                    8.getH(),
                    Text(
                      dataBase[index].title,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    4.getH(),
                    Text(
                      dataBase[index].subtitle,
                      style: TextStyle(
                        color: AppColors.white.withOpacity(.5),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    14.getH(),
                    Row(
                      children: [
                        Text(
                          "₱ ${dataBase[index].price}",
                          style: TextStyle(
                            color: AppColors.c_D17842,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.w, vertical: 16.h),
                            backgroundColor: AppColors.c_D17842,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.r),
                            ),
                          ),
                          onPressed: () async {
                            // CoffeeModels coffeeModels = CoffeeModels(
                            //   image: dataBase[index].image,
                            //   title: dataBase[index].title,
                            //   subtitle: dataBase[index].subtitle,
                            //   price: dataBase[index].price,
                            //   count: dataBase[index].count,
                            // );
                            // // await LocalDatabase.insertGame();
                            // print("Databasega qushildi :)");
                            // setState(() {});
                          },
                          child: Icon(Icons.add),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            options: CarouselOptions(
              height: 0.53 * height,
              viewportFraction: 0.60,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: false,
              autoPlayInterval: const Duration(seconds: 2),
              autoPlayAnimationDuration: const Duration(seconds: 1),
              autoPlayCurve: Curves.linear,
              enlargeCenterPage: true,
              enlargeFactor: 0.2,
              onPageChanged: (v, d) {},
              scrollDirection: Axis.horizontal,
            ),
          ),
          24.getH(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              "popular_now",
              style: TextStyle(
                color: AppColors.white,
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          16.getH(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                24.getW(),
                ...List.generate(
                  categoryDatabase.length,
                      (index) => TextButton(
                    style: TextButton.styleFrom(
                      padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        side: BorderSide(
                          color: activeCategory == index
                              ? AppColors.white.withOpacity(.10)
                              : AppColors.transparent,
                          width: 1.w,
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        activeCategory = index;
                      });
                    },
                    child: Text(
                      categoryDatabase[index].title,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: activeCategory == index
                            ? AppColors.white
                            : AppColors.white.withOpacity(.25),
                      ),
                    ),
                  ),
                ),
                24.getW(),
              ],
            ),
          ),
          24.getH(),
        ],
      ),
      key: scaffoldKey,
      drawerEnableOpenDragGesture: false,
      drawer: const MyDrawer(),
    );
  }
}
