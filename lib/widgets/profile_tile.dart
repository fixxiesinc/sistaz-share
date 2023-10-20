import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: const Color(0xFF151515),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(1000),
              child: RandomAvatar(
                userController.user!.username,
                trBackground: true,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Gap(12),
          Text(
            userController.user!.username,
            style: Styles.body(context),
          ),
        ],
      ),
    );
  }
}
