import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gdg_algiers_events_app/constants/colors.dart';
import 'package:gdg_algiers_events_app/constants/Theme.dart';
import 'package:gdg_algiers_events_app/constants/extensions.dart';
import '../../../logic/cubit/event_cubit/events_searched_cubit.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onSearchSubmitted(String searchQuery) {
      BlocProvider.of<EventsSearchedCubit>(context).searchEvents(searchQuery);
    }

    return Container(
      decoration: BoxDecoration(
        color: AppColors.kWhite,
        borderRadius: BorderRadius.circular(25),
        boxShadow: const [
          BoxShadow(
            color: AppColors.kBlack,
            blurRadius: 15,
            spreadRadius: 0,
            blurStyle: BlurStyle.outer,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: TextField(
        onChanged: onSearchSubmitted,
        decoration: InputDecoration(
          suffixIcon: Transform.scale(
            scale: 0.4,
            child: SvgPicture.asset(
              "assets/icons/search.svg",
              color: AppColors.kGreyColor,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 22,
            horizontal: 22,
          ),
          fillColor: AppColors.kWhite,
          filled: true,
          hintText: "Search For An Event",
          hintStyle: context.textTheme.bodyLarge!.copyWith(
            fontSize: 12,
            color: AppColors.kPrimaryColor.withOpacity(0.75),
          ),
          focusedBorder: AppTheme.whiteInputBorder,
          errorBorder: AppTheme.redInputBorder,
          enabledBorder: AppTheme.whiteInputBorder,
          focusedErrorBorder: AppTheme.redInputBorder,
        ),
      ),
    );
  }
}
