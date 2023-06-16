import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_hub/user/controllers/bookmark_provider.dart';
import 'package:jobs_hub/user/models/response/bookmarks/all_bookmarks.dart';
import 'package:jobs_hub/user/views/common/app_bar.dart';
import 'package:jobs_hub/user/views/common/drawer/drawer_widget.dart';
import 'package:jobs_hub/user/views/ui/bookmarks/widgets/bookmark_widget.dart';
import 'package:provider/provider.dart';

class BookMarkPage extends StatefulWidget {
  const BookMarkPage({super.key});

  @override
  State<BookMarkPage> createState() => _BookMarkPageState();
}

class _BookMarkPageState extends State<BookMarkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          text: "BookMarks",
          child: Padding(
            padding: EdgeInsets.all(12.0.h),
            child: const DrawerWidget(),
          ),
        ),
      ),
      body: Consumer<BookMarkNotifier>(
        builder: (context, bookmarkNotifier, child) {
          bookmarkNotifier.getBookmarks();
          return FutureBuilder<List<AllBookmarks>>(
              future: bookmarkNotifier.bookmarks,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error ${snapshot.error}'),
                  );
                }
                final bookmarks = snapshot.data;
                if (bookmarks?.isEmpty ?? true) {
                  return const Center(
                    child: Text('No Jobs Available Right Now'),
                  );
                }
                return ListView.builder(
                  itemCount: bookmarks?.length,
                  itemBuilder: (context, index) {
                    final bookmark = bookmarks![index];
                    return BookmarkTileWidget(
                      bookmark: bookmark,
                    );
                  },
                );
              });
        },
      ),
    );
  }
}
