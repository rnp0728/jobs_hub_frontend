import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:jobs_hub/admin/controllers/users_provider.dart';
import 'package:jobs_hub/user/services/helpers/internships_helper.dart';
import 'package:jobs_hub/user/views/common/exports.dart';
import 'package:jobs_hub/user/views/ui/internships/internship_page.dart';
import 'package:jobs_hub/user/views/ui/internships/widgets/horizontal_tile.dart';
import 'package:jobs_hub/user/views/ui/search/widgets/custom_field.dart';
import 'package:provider/provider.dart';

class InternshipsSearchPage extends StatefulWidget {
  const InternshipsSearchPage({super.key});

  @override
  State<InternshipsSearchPage> createState() => _InternshipsSearchPageState();
}

class _InternshipsSearchPageState extends State<InternshipsSearchPage> {
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
            hintText: "Search for internship",
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
                    future: InternshipsHelper.searchInternships(
                        searchController.text),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('Error ${snapshot.error}'),
                        );
                      } else if (snapshot.data?.isEmpty ?? true) {
                        return const EmptyStateWidget(
                            text: "Internship not Found");
                      }
                      final internships = snapshot.data;
                      return ListView.builder(
                          itemCount: internships!.length,
                          itemBuilder: (context, index) {
                            final internship = internships[index];
                            return InternshipHorizontalTile(
                              internship: internship,
                              onTap: () {
                                Get.to(() => InternshipPage(
                                    title: internship.title,
                                    id: internship.id));
                              },
                            );
                          });
                    }),
              )
            : const EmptyStateWidget(text: "Start Searching for Internships"));
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
