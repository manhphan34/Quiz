import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/src/data/models/user_rank.dart';
import 'package:quiz/src/screen/user/user_bloc.dart';
import 'package:quiz/src/screen/user/user_event.dart';
import 'package:quiz/src/screen/user/user_state.dart';
import 'package:quiz/src/utils/utils.dart';
import 'package:quiz/src/widget/loader.dart';

class Rank extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RankState();
  }
}

class _RankState extends State<Rank> with WidgetsBindingObserver {
  List<UserRank> users;
  UserBloc _userBloc;
  int index = 0;

  @override
  void initState() {
    super.initState();
    users = List();
    _userBloc = UserBloc();
    _userBloc.add(GetAllUserEvent());
  }

  @override
  void dispose() {
    _userBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("LeaderBoard"),
          backgroundColor: Color(0xffa5d6a7),
          centerTitle: true,
        ),
        body: BlocProvider(
            create: (context) => _userBloc,
            child: BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UserInitialState) {
                  return Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.white,
                    child: Container(
                      width: 50,
                      height: 50,
                      child: LoaderTwo(),
                    ),
                  );
                } else if (state is GetAllUserState) {
                  users = state.ranks;
                }
                return Stack(
                  children: [
                    Container(
                      child: ListView.builder(
                        itemCount: users.length + 1,
                        itemBuilder: (context, index) {
                          if (index < users.length) {
                            return _buildUser(
                                users[index], index + 1, Colors.white, false);
                          } else {
                            return SizedBox(
                              height: 80,
                            );
                          }
                        },
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: Card(
                        margin: EdgeInsets.all(0),
                        elevation: 16,
                        child: Container(
                          height: 81,
                          color: Colors.green.shade200,
                          child: _buildUser(getSelf(), index + 1,
                              Colors.green.shade200, true),
                        ),
                      ),
                    ),
                  ],
                );
              },
            )),
      ),
    );
  }

  UserRank getSelf() {
    for (int i = 0; i < users.length; i++) {
      if (users[i].mobile == _userBloc.user[0].mobile) {
        index = i;
        return users[i];
      }
    }
    return null;
  }

  Widget _buildUser(UserRank user, int position, Color color, bool isSelf) {
    return Column(
      children: [
        Container(
          height: 80,
          child: Container(
            color: color,
            child: Row(
              children: [
                _buildRankPosition(position),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: _buildAvatar(position),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 16),
                        child: Text(
                          isSelf ? "${user.name} (You)" : user.name,
                          style: GoogleFonts.domine(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 14, top: 4),
                        child: Text(
                          user.title,
                          style: GoogleFonts.domine(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 8),
                    alignment: Alignment.centerRight,
                    child: Text(
                      user.rank.toString(),
                      style: GoogleFonts.domine(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 1,
          color: Colors.grey,
        )
      ],
    );
  }

  Widget _buildRankPosition(int position) {
    Widget widget;
    if (position == 1) {
      widget = _buildImage(
          path: getAssetImagePath("gold_rank.png"),
          width: 32,
          height: 32,
          widthBg: 40);
    } else if (position == 2) {
      widget = _buildImage(
          path: getAssetImagePath("silver_rank.png"),
          width: 32,
          height: 32,
          widthBg: 40);
    } else if (position == 3) {
      widget = _buildImage(
          path: getAssetImagePath("bronze_rank.png"),
          width: 32,
          height: 32,
          widthBg: 40);
    } else {
      widget = Container(
        alignment: Alignment.center,
        width: 40,
        height: 40,
        child: Text(
          position.toString(),
          style: GoogleFonts.lobster(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      );
    }
    return widget;
  }

  Widget _buildAvatar(int position) {
    Widget widget;
    if (position == 1) {
      widget = CircleAvatar(
        radius: 28,
        backgroundColor: Colors.yellow.shade400,
        child: CircleAvatar(
          radius: 26,
          backgroundImage: NetworkImage(users[position - 1].image),
        ),
      );
    } else if (position == 2) {
      widget = CircleAvatar(
        radius: 28,
        backgroundColor: Colors.grey.shade400,
        child: CircleAvatar(
          radius: 26,
          backgroundImage: NetworkImage(
            users[position - 1].image,
          ),
        ),
      );
    } else if (position == 3) {
      widget = CircleAvatar(
        radius: 28,
        backgroundColor: Color(0xffcc6633),
        child: CircleAvatar(
          radius: 26,
          backgroundImage: NetworkImage(users[position - 1].image),
        ),
      );
    } else {
      widget = CircleAvatar(
        radius: 28,
        backgroundColor: Colors.blue[900],
        child: CircleAvatar(
          radius: 26,
          backgroundImage: NetworkImage(users[position - 1].image),
        ),
      );
    }

    return widget;
  }

  Widget _buildImage(
          {String path, double width, double height, double widthBg}) =>
      Container(
        alignment: Alignment.center,
        width: widthBg,
        height: 80,
        child: Image.asset(
          path,
          width: width,
          height: height,
        ),
      );
}
