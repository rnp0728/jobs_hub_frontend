import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:jobs_hub/admin/controllers/users_provider.dart';
import 'package:jobs_hub/admin/services/users_helper.dart';
import 'package:jobs_hub/admin/widgets/user_tile.dart';
import 'package:jobs_hub/user/views/common/exports.dart';
import 'package:jobs_hub/user/views/ui/jobs/widgets/job_tile.dart';
import 'package:jobs_hub/user/views/ui/search/widgets/custom_field.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';

class UsersSearchPage extends StatefulWidget {
  const UsersSearchPage({super.key});

  @override
  State<UsersSearchPage> createState() => _UsersSearchPageState();
}

class _UsersSearchPageState extends State<UsersSearchPage> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var userNotifier = Provider.of<UsersNotifier>(context);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(kOrange.value),
          iconTheme: IconThemeData(color: Color(kLight.value)),
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(Icons.arrow_back_ios),
          ),
          title: CustomField(
            hintText: "Search for a user",
            controller: searchController,
            onEditingComplete: () {
              setState(() {});
            },
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: const Icon((AntDesign.search1)),
            ),
          ),
        ),
        body: searchController.text.isNotEmpty
            ? Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 12.h),
                child: FutureBuilder(
                    future: UsersHelper.searchUsers(searchController.text),
                    builder: (context, usersSnapshot) {
                      if (usersSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (usersSnapshot.hasError) {
                        return Center(
                          child: Text('Error ${usersSnapshot.error}'),
                        );
                      } else if (usersSnapshot.data?.isEmpty ?? true) {
                        return const EmptyStateWidget(text: "User not Found");
                      }
                      final users = usersSnapshot.data;
                      return ListView.builder(
                          itemCount: users!.length,
                          itemBuilder: (context, index) {
                            final user = users[index];
                            return UserTile(
                              user: user,
                              onLongPress: () {
                                QuickAlert.show(
                                  context: context,
                                  type: QuickAlertType.warning,
                                  text:
                                      'Do you want remove ${user.username} from Jobs Hub?',
                                  confirmBtnText: 'Yes',
                                  cancelBtnText: 'No',
                                  onConfirmBtnTap: () async {
                                    var response = await userNotifier
                                        .deleteUserByAdmin(userId: user.id);
                                    Get.back();
                                    if (response) {
                                      Get.snackbar(
                                        'Account Deleted',
                                        'Account Deleted Successfully',
                                        colorText: Color(kLight.value),
                                        backgroundColor: Color(kDarkBlue.value),
                                        icon: const Icon(Icons.done),
                                      );
                                    } else {
                                      Get.snackbar(
                                        'Error Occurred',
                                        'Please Try Again Later!',
                                        colorText: Color(kLight.value),
                                        backgroundColor: Color(kDarkBlue.value),
                                        icon: const Icon(Icons.done),
                                      );
                                    }

                                    setState(() {});
                                  },
                                );
                              },
                            );
                          });
                    }),
              )
            : const EmptyStateWidget(text: "Start Searching for Users"));
  }
}

class EmptyStateWidget extends StatelessWidget {
  final String text;
  const EmptyStateWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/optimized_search.png"),
          ReusableText(
              text: text,
              style: appstyle(22, Color(kDark.value), FontWeight.bold)),
        ],
      ),
    );
  }
}
