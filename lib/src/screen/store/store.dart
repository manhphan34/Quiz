import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/src/data/local/database.dart';
import 'package:quiz/src/screen/store/store_bloc.dart';
import 'package:quiz/src/screen/store/store_event.dart';
import 'package:quiz/src/screen/store/store_state.dart';
import 'package:quiz/src/screen/user/user_bloc.dart';
import 'package:quiz/src/screen/user/user_event.dart';
import 'package:quiz/src/screen/user/user_state.dart';
import 'package:quiz/src/utils/Constants.dart';
import 'package:quiz/src/utils/toast.dart';
import 'package:quiz/src/utils/utils.dart';

class Store extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StoreState();
  }
}

class _StoreState extends State<Store> {
  TextStyle _styleHeader = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  StoreBloc _storeBloc;
  UserBloc _userBloc;
  var toolTips = List<bool>();
  int currentToolTip = -1;
  GlobalKey globalKey = GlobalKey();
  UserData user;
  List<ItemData> items = List();
  bool isShowing = false;

  @override
  void initState() {
    _storeBloc = StoreBloc();
    _userBloc = UserBloc();
    _storeBloc.add(StoreGetItemEvent());
    _userBloc.add(UserLoadInformationEvent());
    for (int i = 0; i < 50; i++) {
      toolTips.add(false);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider<UserBloc>(
            create: (context) => _userBloc,
          ),
          BlocProvider<StoreBloc>(
            create: (context) => _storeBloc,
          )
        ],
        child: Scaffold(
          appBar: AppBar(
            title: Text("Store"),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.red[200],
          ),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.red[200],
            child: Column(
              children: [
                _buildHeader(),
                _buildStore(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        UserData user;
        if (state is UserLoadedInformationState) {
          print(state.user.hPoint);
          user = state.user;
          this.user = state.user;
        }
        return Container(
          height: 80,
          child: Card(
            elevation: 16,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildItemHeader(getAssetImagePath("bronze.png"),
                      user == null ? 0 : user.ePoint),
                  _buildItemHeader(getAssetImagePath("silver.png"),
                      user == null ? 0 : user.mPoint),
                  _buildItemHeader(getAssetImagePath("gold.png"),
                      user == null ? 0 : user.hPoint),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildItemHeader(String image, int point) {
    if (point == null) point = 0;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(right: 8),
            child: Image.asset(image),
            width: 30,
            height: 30,
          ),
          Container(
            margin: EdgeInsets.only(right: 24),
            child: Text(
              point.toString(),
              style: _styleHeader,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildStore() {
    return BlocBuilder<StoreBloc, StoreState>(builder: (context, state) {
      if (state is StoreGetItemState) {
        items = state.items;
      } else if (state is StoreUpdateItemState) {
        if (isShowing) {
          showToastSuccess("Buy item success");
          _storeBloc.add(StoreGetItemEvent());
          isShowing = false;
        }
      }
      var size = MediaQuery.of(context).size;
      final double itemWidth = size.width;
      return Container(
        padding: EdgeInsets.all(4),
        width: double.infinity,
        child: GridView.count(
          shrinkWrap: true,
          childAspectRatio: itemWidth / 480,
          crossAxisCount: 3,
          children: _buildListItem(items),
        ),
      );
    });
  }

  List<Widget> _buildListItem(List<ItemData> items) {
    List<Widget> list = List();
    for (int i = 0; i < items.length; i++) {
      list.add(_buildItem(items[i], i));
    }
    return list;
  }

  Widget _buildItem(ItemData item, int index) {
    return Card(
      child: Container(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                item.image,
                width: 100,
                height: 100,
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  if (item.price > getPoint(item.type)) {
                    showToast(
                        "You don't have enough points to purchase this item");
                    return;
                  } else {
                    _updateItem(item);
                  }
                },
                child: Container(
                  height: 30,
                  color: Colors.blueGrey[200],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: _buildPrice(item),
                        alignment: Alignment.centerRight,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 2, right: 2),
              alignment: Alignment.topRight,
              child: Tooltip(
                padding: EdgeInsets.all(8),
                showDuration: Duration(seconds: 10),
                message: item.description,
                margin: EdgeInsets.only(left: 32, right: 32),
                child: Icon(
                  Icons.info,
                  color: Colors.blue[300],
                  size: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPrice(ItemData item) {
    return InkWell(
      onTap: () {
        if (item.price > getPoint(item.type)) {
          showToast("You don't have enough points to purchase this item");
          return;
        } else {
          _updateItem(item);
        }
      },
      child: Row(
        children: [
          Text(
            item.price.toString(),
            style: TextStyle(fontSize: 16, color: Colors.black),
            softWrap: true,
          ),
          Container(
            margin: EdgeInsets.only(left: 4),
            child: Image.asset(_getImagePath(item.type)),
            width: 16,
            height: 16,
          )
        ],
      ),
    );
  }

  String _getImagePath(String type) {
    switch (type) {
      case GOLD:
        return getAssetImagePath("gold.png");
      case SILVER:
        return getAssetImagePath("silver.png");
      case BRONZE:
        return getAssetImagePath("bronze.png");
    }
    return "";
  }

  int getPoint(String type) {
    int p = 0;
    if (type == BRONZE) {
      p = user.ePoint;
    } else if (type == SILVER) {
      p = user.mPoint;
    } else {
      p = user.hPoint;
    }
    return p == null ? 0 : p;
  }

  void _updateItem(ItemData item) {
    isShowing = true;
    _storeBloc
        .add(StoreUpdateItemEvent(id: item.id, quantity: item.quantity + 1));
    int ePoint = user.ePoint;
    int mPoint = user.mPoint;
    int hPoint = user.hPoint;
    if (item.type == BRONZE) {
      ePoint = ePoint - item.price;
    } else if (item.type == SILVER) {
      mPoint = mPoint - item.price;
    } else {
      hPoint = hPoint - item.price;
    }
    _userBloc.add(UserUpdatePointEvent(
        id: user.id, hPoint: hPoint, ePoint: ePoint, mPoint: mPoint));
  }

  @override
  void dispose() {
    _userBloc.close();
    _storeBloc.close();
    super.dispose();
  }
}
