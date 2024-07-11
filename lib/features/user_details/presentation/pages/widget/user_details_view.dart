import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tisteps_task/core/styles/app_text_style.dart';

import '../../../../users/presentation/widget/cached_image_widget.dart';
import '../../bloc/user_detail_bloc.dart';

class UserDetailView extends StatelessWidget {
  final int index;

  const UserDetailView({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDetailBloc, UserDetailState>(
      builder: (context, state) {
        if (state is UserDetailLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is UserDetailLoaded) {
          final user = state.user;
          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(user.avatar ?? ""), fit: BoxFit.cover)),
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                            child: (user.avatar != null)
                                ? Hero(
                                    tag: index,
                                    child: CachedImageWidget(
                                      height: 300.h,
                                      width: double.maxFinite,
                                      imageUrl: user.avatar,
                                    ),
                                  )
                                : const SizedBox()),
                        Positioned(
                          bottom: 0,
                          child: Column(
                            children: [
                              ClipRect(
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                      sigmaX: 10.0, sigmaY: 10.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade200
                                            .withOpacity(0.2)),
                                    child: Center(
                                      child: AnimatedTextKit(
                                        animatedTexts: [
                                          TypewriterAnimatedText(
                                            "${user.firstName ?? ""} ${user.lastName ?? ""} \n ${user.email ?? ""}",
                                            textStyle: AppTextStyle.largeBlack,
                                            speed: const Duration(
                                                milliseconds: 100),
                                          ),
                                        ],
                                        totalRepeatCount: 1,
                                        pause:
                                            const Duration(milliseconds: 100),
                                        displayFullTextOnTap: true,
                                        stopPauseOnTap: true,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (state is UserDetailError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('Unknown state'));
        }
      },
    );
  }
}
