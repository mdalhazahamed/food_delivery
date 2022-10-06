import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utills/colors.dart';
import 'package:food_delivery/utills/dimension.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_and_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;

  double _scaleFactor = 0.8;
  double height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slider section

        Container(
          height: Dimensions.pageView,
          //color: Colors.redAccent,
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, position) {
              return _buildPageItem(position);
            },
          ),
        ),
        new DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        //Popular text
        SizedBox(height: Dimensions.height30),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: 'Popular'),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: EdgeInsets.only(bottom: 3),
                child: BigText(text: '.', color: Colors.black26),
              ),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: EdgeInsets.only(bottom: 2),
                child: SmallText(
                  text: 'Food pairing',
                ),
              ),
            ],
          ),
        ),
        //list of food and image
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 15,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  bottom: Dimensions.height10),
              child: Row(
                children: [
                  //image section
                  Container(
                    height: Dimensions.listViewImgSize,
                    width: Dimensions.listViewImgSize,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white38,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "https://images.unsplash.com/photo-1585032226651-759b368d7246?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Y2hpbmVzZSUyMGZvb2R8ZW58MHx8MHx8&w=1000&q=80",
                        ),
                      ),
                    ),
                  ),
                  //text section

                  Expanded(
                    child: Container(
                      height: Dimensions.lsitViewTextContSize,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimensions.radius20),
                          bottomRight: Radius.circular(Dimensions.radius20),
                        ),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: Dimensions.width10,
                            right: Dimensions.width10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BigText(text: 'Nutritus fruit meal in China'),
                            SizedBox(height: Dimensions.height10),
                            SmallText(text: 'With chinese charactistics'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconTextWidget(
                                  icon: Icons.circle_sharp,
                                  text: 'Normal',
                                  iconColor: AppColors.iconColor1,
                                ),
                                IconTextWidget(
                                  icon: Icons.location_on,
                                  text: '1.7km',
                                  iconColor: AppColors.mainColor,
                                ),
                                IconTextWidget(
                                  icon: Icons.access_time_rounded,
                                  text: '32min',
                                  iconColor: AppColors.iconColor2,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

Widget _buildPageItem(int index) {
  return Stack(
    children: [
      Container(
        height: Dimensions.pageViewContainer,
        margin: EdgeInsets.only(
            left: Dimensions.width10, right: Dimensions.width10),
        decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                "https://1.bp.blogspot.com/-4IkxBCZFPnY/X-jB-LqAc1I/AAAAAAAAKnU/TXwxt9kHqDM9x-0xPDDw-t6EgY2Hu8V2QCLcBGAsYHQ/w1200-h630-p-k-no-nu/hellofresh-discounts-promo-codes.jpg",
              ),
            ),
            borderRadius: BorderRadius.circular(Dimensions.radius30),
            color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc)),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: Dimensions.pageViewTextContainer,
          margin: EdgeInsets.only(
              left: Dimensions.width30,
              right: Dimensions.width30,
              bottom: Dimensions.height30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius30),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0xFFe8e8e8),
                blurRadius: 5.0,
                offset: Offset(-5, 0),
              ),
              BoxShadow(
                color: Colors.white,
                offset: Offset(5, 0),
              )
            ],
          ),
          child: Container(
            padding: EdgeInsets.only(
                left: Dimensions.width15, right: Dimensions.width15),
            child: AppColumn(
              text: 'Chinese Side',
            ),
          ),
        ),
      ),
    ],
  );
}
