import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gdg_algiers_events_app/constants/colors.dart';

class SearchBox extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final void Function() press;

  const SearchBox({
    Key? key,
    required this.onChanged,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: 63.0,
      width: size.width * 0.85,
      margin: const EdgeInsets.only(top: 21, right: 23, left: 34),
      padding: const EdgeInsets.only(left: 22, right: 24),
      decoration: BoxDecoration(
        color: AppColors.kWhite,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.kPrimaryColor.withOpacity(0.07),
            spreadRadius: 12,
            blurRadius: 10,
            offset: const Offset(3, 4),
          )
        ],
      ),
      child: Row(
        children: [
          getTextField(),
          getSearchIcon('assets/icons/search.svg'),
        ],
      ),
    );
  }

  Widget getTextField() {
    return Expanded(
      child: TextField(
        onChanged: onChanged,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "Search For An Event",
          hintStyle: TextStyle(
            fontSize: 12.0,
            color: AppColors.kHintTextColor,
          ),
        ),
      ),
    );
  }

  Widget getSearchIcon(String iconPath) {
    return InkWell(
      onTap: press,
      child: SizedBox(
        width: 15,
        height: 15,
        child: SvgPicture.asset(
          iconPath,
          width: 40.0,
          height: 40.0,
        ),
      ),
    );
  }
}
