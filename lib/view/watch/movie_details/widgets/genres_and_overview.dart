import 'package:flutter/material.dart';
import 'package:movieapp/utils/app_labels.dart';

import '../../../../model/movie/movie_detail_model.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_size.dart';

class GenresAndOverView extends StatelessWidget {
  const GenresAndOverView({
    super.key,
    required this.movies,
  });

  final MovieDetailModel? movies;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppLabels.genres,
            style: TextStyle(color: AppColors.black, fontSize: 20)),
        SizedBox(
          width: AppSize.width(context),
          height: AppSize.height(context) * 0.10,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: movies!.genres.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 2.0, right: 8),
                child: Chip(
                    label: Text(
                      movies!.genres[index].name,
                      style: TextStyle(color: AppColors.white),
                    ),
                    backgroundColor: movies!.genres[index].name == "Action"
                        ? AppColors.actionColor
                        : movies!.genres[index].name == "Thriller"
                            ? AppColors.thirllerColor
                            : movies!.genres[index].name == "Science"
                                ? AppColors.scienceColor
                                : movies!.genres[index].name == "Fiction"
                                    ? AppColors.fictionColor
                                    : AppColors.blue),
              );
            },
          ),
        ),
        const Divider(),
        SizedBox(
          height: AppSize.height(context) * 0.01,
        ),
        Text(AppLabels.overview,
            style: TextStyle(color: AppColors.black, fontSize: 20)),
        SizedBox(
          height: AppSize.height(context) * 0.01,
        ),
        Text(
          movies!.overview,
          style: TextStyle(color: AppColors.textgreyColor, fontSize: 14),
        )
      ],
    );
  }
}
