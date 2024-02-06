import 'package:flutter/material.dart';

import 'package:gdg_algiers_events_app/constants/colors.dart';
import 'package:gdg_algiers_events_app/constants/extensions.dart';

class PopularEventSlide extends StatefulWidget {
  final String name;
  final String location;

  final String? image;
  final Function onTap;
  const PopularEventSlide({
    Key? key,
    this.image,
    required this.location,
    required this.name,
    required this.onTap,
  }) : super(key: key);

  @override
  State<PopularEventSlide> createState() => _PopularEventSlideState();
}

class _PopularEventSlideState extends State<PopularEventSlide> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap(),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          (widget.image != null)
              ? Flexible(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      widget.image!,
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : const SizedBox(),
          const SizedBox(
            width: 20,
          ),
          Flexible(
            flex: 2,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.name,
                      style:
                          context.textTheme.titleLarge!.copyWith(fontSize: 12)
                      //style: CustomTitleStyle(fontSize: 16),
                      ),
                  Transform.translate(
                    offset: const Offset(-5, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: AppColors.kGreyColor.withOpacity(0.6),
                          size: 16,
                        ),
                        Flexible(
                          child: Text(
                            widget.location,
                            maxLines: 1,
                            style: context.textTheme.bodyLarge!.copyWith(
                              fontSize: 12,
                              color: AppColors.kPrimaryColor.withOpacity(0.75),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
