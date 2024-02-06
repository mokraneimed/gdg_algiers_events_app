import 'package:flutter/material.dart';
import 'package:gdg_algiers_events_app/constants/colors.dart';
import 'package:gdg_algiers_events_app/constants/extensions.dart';

class NextEventCard extends StatefulWidget {
  final String name;
  final String location;
  final String date;
  final bool isLiked;
  final String image;
  final Function onTap;

  const NextEventCard({
    Key? key,
    required this.isLiked,
    required this.location,
    required this.date,
    required this.name,
    required this.image,
    required this.onTap,
  }) : super(key: key);

  @override
  State<NextEventCard> createState() => _NextEventCard();
}

class _NextEventCard extends State<NextEventCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.87,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: AppColors.kGrey.withOpacity(0.25),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(1.0, 2.0))
        ],
      ),
      child: InkWell(
        onTap: () {},
        child: Card(
          elevation: 1,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              buildImage(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    buildNameDate(),
                    const SizedBox(
                      height: 5,
                    ),
                    buildLocation(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLocation() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.location_on,
          color: AppColors.kPrimaryColor.withOpacity(0.75),
          size: 12,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          widget.location,
          style: context.textTheme.bodyLarge!.copyWith(
            fontSize: 12,
            color: AppColors.kPrimaryColor.withOpacity(0.75),
          ),
        ),
      ],
    );
  }

  Widget buildNameDate() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.name,
          style: context.textTheme.titleLarge!.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        Row(
          children: [
            const Icon(
              Icons.schedule,
              color: AppColors.kPrimaryColor,
              size: 10,
            ),
            const SizedBox(
              width: 2,
            ),
            Text(
              widget.date,
              style: context.textTheme.bodyLarge!.copyWith(
                  fontSize: 10,
                  color: AppColors.kPrimaryColor.withOpacity(0.75)),
            ),
          ],
        )
      ],
    );
  }

  Widget buildImage() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Image.asset(
            widget.image,
            fit: BoxFit.fitWidth,
            width: double.infinity,
            color: AppColors.kWhite.withOpacity(0.8),
            colorBlendMode: BlendMode.modulate,
          ),
        ),
        widget.isLiked
            ? Positioned(
                right: 10,
                top: 10,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: AppColors.kWhite,
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                    child: const Icon(
                      Icons.favorite_rounded,
                      size: 10,
                      color: AppColors.kRedFavorite,
                    ),
                  ),
                ),
              )
            : Positioned(
                right: 10,
                top: 10,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: AppColors.kWhite,
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                    child: const Icon(
                      Icons.favorite_outline,
                      size: 10,
                      color: AppColors.kRed,
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}
