import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:idea_note/model/home_model.dart';
import 'package:idea_note/repository/note/note_repository.dart';
import 'package:idea_note/widget/home/home_action_button.dart';
import 'package:idea_note/widget/home/home_body.dart';
import 'package:idea_note/widget/home/home_bottom_app_bar.dart';
import 'package:idea_note/widget/home/home_drawer.dart';
import 'package:idea_note/widget/my_app_bar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final noteRepository = Provider.of<NoteRepository>(context);
    return FutureBuilder<bool>(
      initialData: false,
      future: noteRepository.loadNotes(),
      builder: (context, snapshot) {
        return !snapshot.data
            ? Container()
            : MultiProvider(
                providers: [
                  ChangeNotifierProvider<HomeModel>(
                    create: (context) => HomeModel(noteRepository),
                  ),
                ],
                child: Scaffold(
                  appBar: MyAppBar(
                    AppLocalizations.of(context).title,
                    automaticallyImplyLeading: false,
                  ),
                  drawer: HomeDrawer(),
                  body: HomeBody(),
                  floatingActionButton: HomeActionButton(),
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.centerDocked,
                  bottomNavigationBar: HomeBottomAppBar(),
                ),
              );
      },
    );
  }
}
