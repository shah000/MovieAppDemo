import 'package:flutter/material.dart';
import 'package:movieapp/utils/app_labels.dart';
import 'package:movieapp/utils/navigator.dart';
import 'package:movieapp/view/watch/movie_details/get_tikects/proceed_to_pay.dart';
import 'package:movieapp/view/watch/movie_details/get_tikects/widget/custom_appbar.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_size.dart';
import '../../../widgets/custom_blue_button.dart';
import 'widget/select_mapping_seat.dart';

class SelectSeats extends StatefulWidget {
  const SelectSeats(
      {super.key, required this.movieName, required this.movieReleaseDate});
  final String movieName;
  final String movieReleaseDate;

  @override
  State<SelectSeats> createState() => _SelectSeatsState();
}

List<String> dates = ['5 Mar', '6 Mar', '7 Mar', '8 Mar', '9 Mar'];
String selectdDate = '5 Mar';
int selectedSeat = 1;

class _SelectSeatsState extends State<SelectSeats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: PreferredSize(
          preferredSize:
              Size(AppSize.width(context), AppSize.height(context) * 0.10),
          child: CustomAppbar(
              movieName: widget.movieName,
              movieReleaseDate: widget.movieReleaseDate)),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: AppSize.height(context) * 0.05,
            ),
            Text(
              'Date',
              style: TextStyle(
                  color: AppColors.black,
                  fontSize: 19,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: AppSize.height(context) * 0.02,
            ),
            SizedBox(
              width: AppSize.width(context),
              height: AppSize.height(context) * 0.06,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: dates.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectdDate = dates[index];
                        });
                      },
                      child: Chip(
                        backgroundColor: selectdDate == dates[index]
                            ? AppColors.blue
                            : AppColors.chipColor,
                        label: Text(
                          dates[index],
                          style: TextStyle(
                              color: selectdDate == dates[index]
                                  ? AppColors.white
                                  : AppColors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: AppSize.height(context) * 0.02,
            ),
            SizedBox(
              width: AppSize.width(context),
              height: AppSize.height(context) * 0.35,
              child: ListView(scrollDirection: Axis.horizontal, children: [
                const SelectMappingSeat(
                  time: "12:30",
                  price: "\$25",
                  bonus: "2500",
                ),
                SizedBox(
                  width: AppSize.width(context) * 0.04,
                ),
                const SelectMappingSeat(
                  time: "13:30",
                  price: "\$75",
                  bonus: "3000",
                ),
              ]),
            ),
            const Spacer(),
            CustomBlueButton(
              onTap: () {
                navigateTo(ProceedToPay(
                    movieName: widget.movieName,
                    movieReleaseDate: widget.movieReleaseDate));
              },
              title: AppLabels.selectSeats,
            ),
            SizedBox(
              height: AppSize.height(context) * 0.01,
            ),
          ],
        ),
      )),
    );
  }
}
