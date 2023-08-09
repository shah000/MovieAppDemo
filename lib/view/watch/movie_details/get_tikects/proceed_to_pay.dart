import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movieapp/utils/app_images.dart';
import 'package:movieapp/view/watch/movie_details/get_tikects/widget/seats_info.dart';
import 'package:movieapp/view/watch/movie_details/get_tikects/widget/zoombutton.dart';
import 'package:movieapp/view/widgets/custom_blue_button.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_size.dart';
import 'widget/custom_appbar.dart';

class ProceedToPay extends StatefulWidget {
  const ProceedToPay(
      {super.key, required this.movieName, required this.movieReleaseDate});
  final String movieName;
  final String movieReleaseDate;

  @override
  State<ProceedToPay> createState() => _ProceedToPayState();
}

class _ProceedToPayState extends State<ProceedToPay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize:
              Size(AppSize.width(context), AppSize.height(context) * 0.10),
          child: CustomAppbar(
              movieName: widget.movieName,
              movieReleaseDate: widget.movieReleaseDate)),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: AppSize.width(context),
              height: AppSize.height(context) * 0.50,
              color: AppColors.bgColor,
              child: Column(
                children: [
                  const Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(AppImages.largeMapping),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const ZoomInButton(
                          iconData: Icons.add,
                        ),
                        SizedBox(
                          width: AppSize.width(context) * 0.02,
                        ),
                        const ZoomOutButton(
                          iconData: Icons.minimize,
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Divider(
                      thickness: 8,
                    ),
                  ),
                ],
              )),
          SizedBox(
            height: AppSize.height(context) * 0.02,
          ),
          Row(
            children: [
              SeatInfo(
                image: AppImages.selectedSeat,
                title: "Selected",
              ),
              SizedBox(
                width: AppSize.width(context) * 0.04,
              ),
              SeatInfo(
                image: AppImages.notSeat,
                title: "Not available",
              ),
            ],
          ),
          SizedBox(
            height: AppSize.height(context) * 0.00,
          ),
          Row(
            children: [
              SeatInfo(
                image: AppImages.vipSeat,
                title: "VIP (150\$)",
              ),
              SizedBox(
                width: AppSize.width(context) * 0.04,
              ),
              SeatInfo(
                image: AppImages.regularSeat,
                title: "Regular (50 \$)",
              ),
            ],
          ),
          SizedBox(
            height: AppSize.height(context) * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: SizedBox(
              width: AppSize.width(context) * 0.33,
              height: AppSize.height(context) * 0.04,
              child: Chip(
                  backgroundColor: AppColors.chipColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  label: Row(
                    children: [
                      RichText(
                        text: TextSpan(
                            text: '4 / ',
                            style: TextStyle(
                                color: AppColors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                text: '3 row',
                                style: TextStyle(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16),
                              ),
                            ]),
                      ),
                      const Spacer(),
                      const Icon(Icons.close)
                    ],
                  )),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 5,
                        backgroundColor: AppColors.bgColor,
                        fixedSize: Size(AppSize.width(context) * 0.30,
                            AppSize.height(context) * 0.07),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Total Price",
                          style: TextStyle(color: AppColors.black),
                        ),
                        Text(
                          "\$ 50",
                          style: TextStyle(
                              color: AppColors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
                SizedBox(
                  width: AppSize.width(context) * 0.02,
                ),
                Expanded(
                    child: CustomBlueButton(
                        onTap: () {}, title: 'Proceed to pay')),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
