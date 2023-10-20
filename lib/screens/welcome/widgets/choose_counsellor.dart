import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class ChooseCounsellor extends StatefulWidget {
  const ChooseCounsellor({super.key});

  @override
  State<ChooseCounsellor> createState() => _ChooseCounsellorState();
}

class _ChooseCounsellorState extends State<ChooseCounsellor> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        bool isMobile = sizingInformation.isMobile;
        bool isDesktop = sizingInformation.isDesktop;
        return Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Choose preferred counsellor',
                style: Styles.h1(context, color: Colors.white),
              ),
              Gap(isMobile ? 20 : 30),
              FutureBuilder(
                future: DatabaseService.fetchCounsellors(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    context.loaderOverlay.show();
                    return Container();
                  }

                  context.loaderOverlay.hide();
                  final data = snapshot.data!;

                  return GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    crossAxisCount: 4,
                    children: List.generate(
                      data.length,
                      (index) {
                        final counsellor = data[index];
                        return Obx(() {
                          bool selected =
                              FormController.preferredCounsellor.value ==
                                  counsellor.id;
                          return Tooltip(
                            message: counsellor.name,
                            textStyle: const TextStyle(
                                fontSize: 14, color: Colors.black),
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                FormController.preferredCounsellor(
                                    counsellor.id);
                              },
                              child: CircleAvatar(
                                backgroundColor: selected
                                    ? Colors.white
                                    : const Color(0xFF151515),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(1000),
                                  child: Image.network(
                                    counsellor.avatarUrl,
                                    fit: BoxFit.cover,
                                    height: 300,
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
                      },
                    ),
                  );
                },
              ),
              const Gap(50),
              Obx(() {
                return Button(
                  label: 'Done',
                  paddingBlock: 14,
                  paddingInline: 100,
                  maxWidth: isDesktop ? false : true,
                  labelSize: 14,
                  color: FormController.preferredCounsellor.value.isNotEmpty
                      ? Colors.white
                      : const Color(0xFF222222),
                  onPressed: () async {
                    if (FormController.preferredCounsellor.value.isNotEmpty) {
                      context.loaderOverlay.show();

                      final user = User.fromMap(FormController.toMap());
                      await DatabaseService.addUser(user);

                      if (mounted) context.loaderOverlay.hide();

                      userController.user = user;

                      router.go('/${Routes.chat}');
                    }
                  },
                );
              })
            ],
          ),
        );
      },
    );
  }
}
