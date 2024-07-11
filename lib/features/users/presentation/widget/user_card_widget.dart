import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tisteps_task/core/styles/app_colors.dart';
import 'package:tisteps_task/features/users/domain/entity/user_list_model/datum.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../../core/router/app_route_enum.dart';
import '../../../../core/styles/app_text_style.dart';
import '../../domain/entity/user_details_nav_model/user_details_nav_model.dart';

class UserCard extends StatelessWidget {
  final int index;
  final UserData user;

  const UserCard({super.key, required this.user, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, AppRouteEnum.userDetailsPage.name,
              arguments: UserDetailsNavModel(index: index, userId: user.id!));
        },
        child: Card(
          child: Row(
            children: [
              (user.avatar != null)
                  ? Hero(
                      tag: index,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: user.avatar ?? "",
                          width: 100.sp,
                          height: 100.sp,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : SizedBox(
                      width: 70.sp,
                      child: const CircleAvatar(
                        backgroundColor: AppColors.grey,
                        radius: 40,
                      ),
                    ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${user.firstName} ${user.lastName}',
                      style: AppTextStyle.xxxLargeBlack,
                    ),
                    Text(
                      user.email ?? "",
                      style: AppTextStyle.xxLargeGrey,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
