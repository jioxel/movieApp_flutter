import 'package:animate_do/animate_do.dart';
import 'package:e_cinemapedia/config/helper/human_format.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/movie.dart';

class MoviewHorizontalListview extends StatefulWidget {
  final List<Movie> movies;
  final String? title;
  final String? subTitle;
  final VoidCallback? loadNextPage;
  const MoviewHorizontalListview(
      {super.key,
      required this.movies,
      this.subTitle,
      this.title,
      this.loadNextPage});

  @override
  State<MoviewHorizontalListview> createState() =>
      _MoviewHorizontalListviewState();
}

class _MoviewHorizontalListviewState extends State<MoviewHorizontalListview> {
  final scrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      if (widget.loadNextPage == null) return;
      if (scrollController.position.pixels + 200 >=
          scrollController.position.maxScrollExtent) {
        widget.loadNextPage!();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 370,
      child: Column(
        children: [
          if (widget.title != null || widget.subTitle != null)
            _Title(Title: widget.title, subTitle: widget.subTitle),
          Expanded(
              child: ListView.builder(
            controller: scrollController,
            itemCount: widget.movies.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return FadeInRight(child: _Slide(movie: widget.movies[index]));
            },
          ))
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;
  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                movie.posterPath,
                fit: BoxFit.cover,
                width: 150,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return Center(
                        child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ));
                  }
                  return FadeIn(child: child);
                },
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: 150,
            child: Text(
              movie.title,
              maxLines: 2,
              style: textStyle.titleSmall,
            ),
          ),
          //Rating
          Row(
            children: [
              Icon(
                Icons.star_half_outlined,
                color: Colors.yellow.shade800,
              ),
              const SizedBox(
                width: 3,
              ),
              Text(
                '${movie.voteAverage}',
                style: textStyle.bodyMedium
                    ?.copyWith(color: Colors.yellow.shade800),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                HumanFormats.number(movie.popularity),
                style: textStyle.bodySmall,
              )
            ],
          )
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String? Title;
  final String? subTitle;
  const _Title({this.Title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return Container(
      padding: const EdgeInsets.only(top: 20),
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Row(children: [
        if (Title != null)
          Text(
            Title!,
            style: titleStyle,
          ),
        const Spacer(),
        if (subTitle != null)
          FilledButton.tonal(
            onPressed: () {},
            child: Text(subTitle!),
          )
      ]),
    );
  }
}
