import 'package:clean_folder_str/screens/home/widgets/personal_info_child_tile.dart';
import 'package:clean_folder_str/utils/theme/colors.dart';
import 'package:flutter/material.dart';

class PersonalInfoParentTile extends StatelessWidget {
  const PersonalInfoParentTile({
    super.key,
    required this.personalInfoChildTile,
  });

  final List<PersonalInfoChildTile> personalInfoChildTile;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(
        left: 24,
        top: 12,
        right: 24,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 24 / 2,
        vertical: 24 / 2,
      ),
      decoration: BoxDecoration(
        color: MyAppColors.whiteColor,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "General Info",
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(
            height: 15,
          ),
          ...personalInfoChildTile,
        ],
      ),
    );
  }
}
// Container(
//           margin: const EdgeInsets.symmetric(
//             horizontal: 24,
//           ),
//           padding: const EdgeInsets.only(
//             left: 24 / 2,
//           ),
//           decoration: BoxDecoration(
//             color: AppColors.whiteColor,
//             shape: BoxShape.rectangle,
//             borderRadius: BorderRadius.circular(SizeConfig.borderRadiusSize),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ProfileListTile(
//                 leadingWidget: Icon(
//                   Icons.person_outline_rounded,
//                   color: AppColors.primarycolor,
//                 ),
//                 title: 'Personal Information',
//                 onTap: () => Navigator.of(context)
//                     .pushNamed(PersonalInfoScreen.routeName),
//               ),
//               ProfileListTile(
//                 leadingWidget: Icon(
//                   Icons.business_center_outlined,
//                   color: AppColors.primarycolor,
//                 ),
//                 title: 'Work Information',
//               ),
//               ProfileListTile(
//                 leadingWidget: Icon(
//                   Icons.settings_outlined,
//                   color: AppColors.primarycolor,
//                 ),
//                 title: 'Settings',
//               ),
//               ProfileListTile(
//                 leadingWidget: Icon(
//                   Icons.logout_rounded,
//                   color: AppColors.redColor,
//                 ),
//                 title: 'Logout',
//                 titleColor: AppColors.redColor,
//                 trailing: const SizedBox.shrink(),
//               ),
//             ],
//           ),
//         )