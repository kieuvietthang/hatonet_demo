// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hatonet_demo/app/module/res/dimens.dart';

class NavigationDrawerWidget extends StatefulWidget {
  final appBarSize = AppBar().preferredSize.height;
  double heightButton = 50.0;

  double statusBarHeight = 0.0;

  NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  //đổi màu Dashboard
  bool _hasBeenTextDashboard = false;

  //Gói dịch vụ
  bool _hasBeenServicePack = false;
  bool _hasBeenTextServicePack = false;

  //Account
  bool _hasBeenTextAccount = false;

  //Ý kiến khách hàng
  bool _hasBeencustomer = false;
  bool _hasBeenTextcustomer = false;

  double statusBarHeight = 0.0;

  @override
  Widget build(BuildContext context) {
    var paddingBottom = widget.statusBarHeight == 0.0
        ? appBarSize * 1.0
        : appBarSize + widget.statusBarHeight;
    final double statusbarHeight = MediaQuery.of(context).padding.bottom;
    return Container(
      // padding: EdgeInsets.only(bottom: statusbarHeight),
      // margin: EdgeInsets.only(bottom: paddingBottom),
      child: Drawer(
        child: Material(
          color: Color(0xFF1F1F1F),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'assets/images/logo hatonet-07 (2).png',
                  height: 70,
                  width: 220,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'TỔNG QUAN',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.3),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 5),
                height: 40,
                child: TextButton(
                  onPressed: () {  },
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: SvgPicture.asset(
                          'assets/icons/ic_grid_add.svg',
                          width: 18,
                          height: 18,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Text(
                          'Dashboard',
                          style: TextStyle(
                              color: _hasBeenTextDashboard
                                  ? Colors.white.withOpacity(0.8)
                                  : Colors.white.withOpacity(0.8),
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => AccountPagee()));
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'QUẢN LÝ CÔNG VIỆC',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.3),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 15,
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: SvgPicture.asset(
                        'assets/icons/ic_assignment.svg',
                        width: 18,
                        height: 18,
                        color: Colors.white.withOpacity(0.3),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        'Quản lý việc làm',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.3),
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: PopupMenu(
                          menulist: [
                            PopupMenuItem(
                              child: ListTile(
                                onTap: () {
                                  // Navigator.of(context).push(
                                  //   CustomPageRoute(
                                  //       child: JobPostingsPage(),
                                  //       direction: AxisDirection.left),
                                  // );
                                },
                                title: Text('Tin đăng tuyển'),
                              ),
                            ),
                            PopupMenuItem(
                              child: ListTile(
                                title: Text('Đã ứng tuyển'),
                              ),
                            ),
                            PopupMenuItem(
                              child: ListTile(
                                onTap: () {
                                  // Navigator.of(context).push(
                                  //   CustomPageRoute(
                                  //       child: FavoriteJobPostingsPage(
                                  //         jobPostings: JobPostings(
                                  //             id: '',
                                  //             isFavorite: false,
                                  //             academicLevel: '',
                                  //             contractTerm: '',
                                  //             title: '',
                                  //             paymentTerm: '',
                                  //             skill: '',
                                  //             area: '',
                                  //             amount: '',
                                  //             rank: '',
                                  //             workingForm: '',
                                  //             applicationDeadline: '',
                                  //             unitPrice: '',
                                  //             experience: '',
                                  //             skillRequirements: '',
                                  //             culturalEnvironment: '',
                                  //             jobDescription: ''),
                                  //       ),
                                  //       direction: AxisDirection.left),
                                  // );
                                },
                                title: Text('Đã lưu'),
                              ),
                            ),
                          ],
                          icon: SvgPicture.asset(
                            'assets/icons/ic_chevron_down.svg',
                            color: Colors.white.withOpacity(0.3),
                            height: 18,
                            width: 18,
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, top: 5),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: SvgPicture.asset(
                        'assets/icons/ic_users.svg',
                        width: 18,
                        height: 18,
                        color: Colors.white.withOpacity(0.3),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        'Hồ sơ ứng viên',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.3),
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: PopupMenu(
                        menulist: const [
                          PopupMenuItem(
                            child: ListTile(
                              title: Text('Danh sách của tôi'),
                            ),
                          ),
                          PopupMenuItem(
                            child: ListTile(
                              title: Text('Đã ứng tuyển'),
                            ),
                          ),
                        ],
                        icon: SvgPicture.asset(
                          'assets/icons/ic_chevron_down.svg',
                          color: Colors.white.withOpacity(0.3),
                          height: 18,
                          width: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 50,
                child: TextButton(
                  style: TextButton.styleFrom(
                    textStyle: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    // Navigator.of(context).push(
                    //   CustomPageRoute(
                    //       child: CreateServicePack(
                    //           services: Services(
                    //               usedtime: '',
                    //               name: '',
                    //               cost: '',
                    //               support: '',
                    //               describe: '',
                    //               promotional: '',
                    //               id: '',
                    //               status: '',
                    //               isFavorite: false,
                    //               isEdit: false)),
                    //       direction: AxisDirection.left),
                    // );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: SvgPicture.asset(
                              'assets/icons/ic_paperclip.svg',
                              width: 18,
                              height: 18,
                              color: Colors.white.withOpacity(0.3),
                            )),
                        Expanded(
                          flex: 4,
                          child: Text(
                            'Gói dịch vụ',
                            style: TextStyle(
                                color: _hasBeenTextServicePack
                                    ? Colors.white.withOpacity(0.3)
                                    : Colors.white.withOpacity(0.3),
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: PopupMenu(
                              menulist: [
                                PopupMenuItem(
                                  child: ListTile(
                                    onTap: () {},
                                    //     Navigator.of(context).push(
                                    //   CustomPageRoute(
                                    //       child: DeleteHistoryPack(),
                                    //       direction: AxisDirection.left),
                                    // ),
                                    title: Text('Lịch sử xóa'),
                                  ),
                                ),
                                PopupMenuItem(
                                  child: ListTile(
                                    onTap: () {},
                                    title: Text('Gói yêu thích'),
                                  ),
                                ),
                              ],
                              icon: SvgPicture.asset(
                                'assets/icons/ic_chevron_down.svg',
                                color: Colors.white.withOpacity(0.3),
                                height: 24,
                                width: 24,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'CÀI ĐẶT',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.3),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              //Tài khoản
              Container(
                padding: EdgeInsets.only(left: 5),
                height: 40,
                child: TextButton(
                  onPressed: () {
                    // Navigator.of(context).push(
                    //   CustomPageRoute(
                    //       child: AccountPagee(), direction: AxisDirection.down),
                    // );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed))
                          return Color(0xFFEA530A);
                        return Color(0xFF1F1F1F);
                      },
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: SvgPicture.asset(
                            'assets/icons/ic_users.svg',
                            width: 18,
                            height: 18,
                            color: Colors.white.withOpacity(0.3),
                          )),
                      Expanded(
                        flex: 5,
                        child: Text(
                          'Tài Khoản',
                          style: TextStyle(
                              color: _hasBeenTextAccount
                                  ? Colors.white.withOpacity(0.3)
                                  : Colors.white.withOpacity(0.3),
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 5),
                height: 40,
                child: TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed))
                          return Color(0xFFEA530A);
                        return Color(0xFF1F1F1F);
                      },
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: SvgPicture.asset(
                            'assets/icons/ic_message.svg',
                            width: 18,
                            height: 18,
                            color: Colors.white.withOpacity(0.3),
                          )),
                      Expanded(
                        flex: 5,
                        child: Text(
                          'Ý kiến khách hàng',
                          style: TextStyle(
                              color: _hasBeenTextcustomer
                                  ? Colors.white.withOpacity(0.3)
                                  : Colors.white.withOpacity(0.3),
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 5),
                height: 40,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed))
                          return Color(0xFFEA530A);
                        return Color(0xFF1F1F1F);
                      },
                    ),
                  ),
                  onPressed: () {
                    // setState(() {
                    //   _hasBeencustomer = !_hasBeencustomer;
                    //   _hasBeenTextcustomer = !_hasBeenTextcustomer;
                    // });
                    // Navigator.of(context).push(
                    //   CustomPageRoute(
                    //       child: DetailsPage(
                    //         info: Info(
                    //           '',
                    //           '',
                    //           '',
                    //           '',
                    //           '',
                    //           '',
                    //           '',
                    //           '',
                    //           '',
                    //           '',
                    //           '',
                    //           '',
                    //         ),
                    //         onClick: () {
                    //           Navigator.pop(context);
                    //         },
                    //       ),
                    //       direction: AxisDirection.left),
                    // );

                    setState(() {
                      _hasBeencustomer = !_hasBeencustomer;
                      _hasBeenTextcustomer = !_hasBeenTextcustomer;
                    });

                    // Navigator.of(context).push(
                    //   CustomPageRoute(
                    //       child: DetailsPage(
                    //         info: Info(
                    //           '',
                    //           '',
                    //           '',
                    //           '',
                    //           '',
                    //           '',
                    //           '',
                    //           '',
                    //           '',
                    //           '',
                    //           '',
                    //           '',
                    //         ),
                    //         onClick: () {
                    //           Navigator.pop(context);
                    //         },
                    //       ),
                    //       direction: AxisDirection.left),
                    // );
                  },
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: SvgPicture.asset(
                            'assets/icons/ic_users.svg',
                            width: 18,
                            height: 18,
                            color: Colors.white.withOpacity(0.3),
                          )),
                      Expanded(
                        flex: 5,
                        child: Text(
                          'Thông tin chi tiết',
                          style: TextStyle(
                              color: _hasBeenTextcustomer
                                  ? Colors.white.withOpacity(0.3)
                                  : Colors.white.withOpacity(0.3),
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PopupMenu extends StatelessWidget {
  final List<PopupMenuEntry> menulist;
  final Widget? icon;

  const PopupMenu({Key? key, required this.menulist, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      itemBuilder: ((context) => menulist),
      icon: icon,
    );
  }
}
