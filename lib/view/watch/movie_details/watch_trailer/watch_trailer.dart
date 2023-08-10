import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:movieapp/controller/movie_controller.dart';
import 'package:movieapp/model/movie/movie_video_model.dart';
import 'package:movieapp/utils/app_colors.dart';
import 'package:movieapp/utils/app_labels.dart';
import 'package:movieapp/utils/navigator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../widgets/custom_loading.dart';

class WatchTrailer extends StatefulWidget {
  const WatchTrailer({super.key, required this.moiveId});

  final int moiveId;

  @override
  State<WatchTrailer> createState() => _WatchTrailerState();
}

class _WatchTrailerState extends State<WatchTrailer> {
  final controller = Get.put(MovieController());

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.black,
        title: Text(AppLabels.watchTrailer),
      ),
      backgroundColor: Colors.transparent,
      body: SafeArea(
          child: FutureBuilder<MovieVideolModel>(
        future: controller.getMovieTrailer(movieId: widget.moiveId),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CustomLoading();
          } else {
            MovieVideolModel? movieVideos = snapshot.data;
            final specificTrailer = movieVideos!.results.firstWhere(
              (trailer) => trailer.type == Type.TRAILER,
            );

            final videoKey = specificTrailer.key;

            return Center(
              child: YoutubePlayer(
                controller: YoutubePlayerController(
                  initialVideoId: videoKey,
                  flags: const YoutubePlayerFlags(
                      autoPlay: true,
                      mute: false,
                      hideControls: false,
                      showLiveFullscreenButton: false),
                ),
                onEnded: (metaData) {
                  navigateBack();
                },
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.blue,
              ),
            );
          }
        },
      )),
    );
  }
}
