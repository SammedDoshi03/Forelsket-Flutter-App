import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:forelsket/Services/authservice.dart';
import 'package:forelsket/UI/Profile/data/collections.dart';
import 'package:forelsket/UI/Profile/data/friends.dart';
import 'package:forelsket/UI/Profile/theme_state.dart';
import 'package:forelsket/UI/Profile/utils/responsive.dart';
import 'package:forelsket/UI/Profile/widgets/avator_network_icon.dart';
import 'package:forelsket/UI/Profile/widgets/circle_button.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  // const ProfileScreen({Key? key}) : super(key: key);
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<ThemeState>(context);
    final responsive = Responsive.of(context);

    const coveragePageImageWhite = 'assets/facebook_ui/background/bk1.jpg';
    const profileImage = 'assets/common/images/dp.png';
    const searchIcon = 'assets/facebook_ui/icons/search_icon.svg';
    const feed = 'Single | Adventure, Found | Developer 👨🏽‍💻';

    return Scaffold(
      body: LayoutBuilder(
        builder: (_, constraints) {
          final height = constraints.maxHeight;
          return Stack(
            children: [
              Positioned(
                bottom: responsive.heightPercent(68),
                top: 0,
                right: -50,
                left: -50,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.scaleDown,
                        image: AssetImage(coveragePageImageWhite)),
                  ),
                ),
              ),
              Positioned(
                top: responsive.widthPercent(10),
                right: 25,
                left: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleButton(
                      callback: () => Navigator.of(context).pop(),
                      icon: FaIcon(
                        FontAwesomeIcons.chevronLeft,
                        color: const Color(0xffffffff),
                        size: responsive.widthPercent(4),
                      ),
                      backgroundColor: (themeState.isDarkTheme)
                          ? const Color(0xff2e3441)
                          : const Color(0xff364987),
                      height: responsive.widthPercent(10),
                      width: responsive.widthPercent(10),
                    ),
                    CircleButton(
                      callback: () => debugPrint('Search'),
                      icon: SvgPicture.asset(
                        searchIcon,
                        height: responsive.widthPercent(4),
                      ),
                      backgroundColor: (themeState.isDarkTheme)
                          ? const Color(0xff2e3441)
                          : const Color(0xff364987),
                      height: responsive.widthPercent(10),
                      width: responsive.widthPercent(10),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: responsive.heightPercent(25),
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  padding:
                      EdgeInsets.only(top: responsive.heightPercent(25) / 3),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '${user!.displayName}',
                        style: TextStyle(
                          fontSize: responsive.heightPercent(3.5),
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        feed,
                        style: TextStyle(
                          fontSize: responsive.heightPercent(1.5),
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          WideButton(
                            callback: () => debugPrint('Message'),
                            text: 'Message',
                            icon: FaIcon(
                              FontAwesomeIcons.facebookMessenger,
                              color: const Color(0xffffffff),
                              size: responsive.heightPercent(2),
                            ),
                            height: responsive.heightPercent(5.5),
                            width: responsive.widthPercent(47),
                            backgroundColor: const Color(0xff3284f5),
                            borderRadius: BorderRadius.circular(
                              responsive.widthPercent(5.5),
                            ),
                            fontColor: const Color(0xffffffff),
                            fontSize: 16,
                          ),
                          WideButton(
                            callback: () {
                              debugPrint('Call');
                              AuthService().signOut();
                            },
                            text: 'Log out',
                            height: responsive.heightPercent(5.5),
                            width: responsive.widthPercent(25),
                            backgroundColor: Colors.transparent,
                            borderRadius: BorderRadius.circular(
                              responsive.widthPercent(5.5),
                            ),
                            border: Border.all(
                              color: (themeState.isDarkTheme)
                                  ? Theme.of(context).accentColor
                                  : const Color(0xff3284f5),
                            ),
                            fontColor: (themeState.isDarkTheme)
                                ? Theme.of(context).accentColor
                                : const Color(0xff3284f5),
                            fontSize: 16,
                          ),
                          WideButton(
                            callback: () => debugPrint('Settings'),
                            icon: FaIcon(
                              FontAwesomeIcons.ellipsisH,
                              color: const Color(0xffa1a8bf),
                              size: responsive.heightPercent(2.3),
                            ),
                            height: responsive.heightPercent(5.5),
                            width: responsive.heightPercent(5.5),
                            backgroundColor: (themeState.isDarkTheme)
                                ? const Color(0xff414752)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(
                              responsive.widthPercent(6),
                            ),
                            border: (themeState.isDarkTheme)
                                ? null
                                : Border.all(
                                    color: (themeState.isDarkTheme)
                                        ? Theme.of(context).accentColor
                                        : const Color(0xffe6e6e6),
                                  ),
                            fontColor: (themeState.isDarkTheme)
                                ? Theme.of(context).accentColor
                                : const Color(0xff3284f5),
                            fontSize: 16,
                          ),
                        ],
                      ),
                      SizedBox(height: responsive.heightPercent(2)),
                      Divider(
                        thickness: 2,
                        color: (themeState.isDarkTheme)
                            ? const Color(0xff3f434d)
                            : Theme.of(context).dividerColor,
                        indent: 10,
                        endIndent: 10,
                      ),
                      SizedBox(height: responsive.heightPercent(1)),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: responsive.widthPercent(5),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ProfileInformationItem(
                              icon: SvgPicture.asset(
                                'assets/facebook_ui/icons/home_icon.svg',
                                height: responsive.heightPercent(1.4),
                                color: const Color(0xffccd1e1),
                              ),
                              text: 'User Id : ${user!.uid}',
                              fontColor: Theme.of(context).accentColor,
                            ),
                            SizedBox(height: responsive.heightPercent(1)),
                            ProfileInformationItem(
                              icon: FaIcon(
                                FontAwesomeIcons.solidClock,
                                size: responsive.heightPercent(1.4),
                                color: const Color(0xffccd1e1),
                              ),
                              text: 'User mail id : ${user!.email}',
                              fontColor: Theme.of(context).accentColor,
                            ),
                            SizedBox(height: responsive.heightPercent(1)),
                            ProfileInformationItem(
                              icon: FaIcon(
                                FontAwesomeIcons.infoCircle,
                                size: responsive.heightPercent(1.4),
                                color: const Color(0xffccd1e1),
                              ),
                              text:
                                  'Login Details : ${user!.metadata.lastSignInTime}',
                              fontColor: Theme.of(context).accentColor,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: responsive.heightPercent(2)),
                      Container(
                        height: height / 6,
                        child: ListView.separated(
                          itemCount: collections.length,
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(
                            horizontal: responsive.widthPercent(5),
                          ),
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (_, index) => Column(
                            children: [
                              Container(
                                height: responsive.widthPercent(25),
                                width: responsive.widthPercent(20),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      collections[index].collectionImage,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(20),
                                    onTap: () => debugPrint(
                                      '${collections[index].collectionName}',
                                    ),
                                    child: const SizedBox(),
                                  ),
                                ),
                              ),
                              SizedBox(height: responsive.heightPercent(.5)),
                              Text(
                                '${collections[index].collectionName}',
                                style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontSize: responsive.widthPercent(3),
                                  fontWeight: FontWeight.w300,
                                ),
                              )
                            ],
                          ),
                          separatorBuilder: (_, __) =>
                              const SizedBox(width: 25),
                        ),
                      ),
                      Divider(
                        thickness: 2,
                        color: (themeState.isDarkTheme)
                            ? const Color(0xff3f434d)
                            : Theme.of(context).dividerColor,
                        indent: 10,
                        endIndent: 10,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: responsive.widthPercent(5),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: 'Friends ',
                                      style: TextStyle(
                                        fontSize: responsive.heightPercent(2.3),
                                        fontWeight: FontWeight.bold,
                                        color: (themeState.isDarkTheme)
                                            ? const Color(0xffe1e1e1)
                                            : Theme.of(context).accentColor,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: '(2,004 Following)',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize:
                                                responsive.heightPercent(2),
                                            color: const Color(0xffbbc0d0),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  WideButton(
                                    callback: () => debugPrint('View all'),
                                    text: 'View all',
                                    height: responsive.heightPercent(3.2),
                                    width: responsive.widthPercent(22),
                                    backgroundColor: Colors.transparent,
                                    borderRadius: BorderRadius.circular(
                                      responsive.widthPercent(1),
                                    ),
                                    fontColor: const Color(0xff3284f5),
                                    fontSize: responsive.heightPercent(1.5),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: responsive.heightPercent(2)),
                            Flexible(
                              fit: FlexFit.loose,
                              child: ListView.separated(
                                itemCount: friends.length,
                                scrollDirection: Axis.horizontal,
                                padding: EdgeInsets.symmetric(
                                  horizontal: responsive.widthPercent(5),
                                ),
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (_, index) => Column(
                                  children: [
                                    Container(
                                      height: height / 12.5,
                                      width: height / 12.5,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            friends[index].friendImage,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                      child: ClipOval(
                                        child: Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            onTap: () => debugPrint(
                                                '${friends[index].friendName}'),
                                            child: const SizedBox(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                        height: responsive.widthPercent(.5)),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${friends[index].friendName}',
                                          style: TextStyle(
                                            color:
                                                Theme.of(context).accentColor,
                                            fontSize:
                                                responsive.widthPercent(3),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                separatorBuilder: (_, __) =>
                                    const SizedBox(width: 15),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 1,
                left: 1,
                top: responsive.heightPercent(28) / 2,
                child: Hero(
                  tag: profileImage,
                  child: AvatarNetworkIcon(
                    profileImage: AuthService().imageURL != ''
                        ? AuthService().imageURL
                        : '${user!.photoURL}',
                    child: const SizedBox(),
                    height: responsive.heightPercent(18),
                    width: responsive.heightPercent(18),
                    marginColor: (themeState.isDarkTheme)
                        ? const Color(0xff3284f5)
                        : const Color(0xffffffff),
                    marginWidth: 6,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class ProfileInformationItem extends StatelessWidget {
  const ProfileInformationItem({
    Key? key,
    required this.icon,
    required this.text,
    required this.fontColor,
    this.fontSize = 14,
  }) : super(key: key);

  final Widget icon;
  final String text;
  final double fontSize;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        const SizedBox(width: 15),
        Text(
          text,
          style: TextStyle(
            color: fontColor,
            fontSize: fontSize,
          ),
        )
      ],
    );
  }
}

class WideButton extends StatelessWidget {
  const WideButton({
    Key? key,
    required this.height,
    required this.width,
    required this.backgroundColor,
    required this.borderRadius,
    required this.callback,
    required this.fontSize,
    required this.fontColor,
    this.text,
    this.icon,
    this.border,
  }) : super(key: key);

  final double height;
  final double width;
  final BorderRadius borderRadius;
  final VoidCallback callback;
  final Color backgroundColor;
  final double fontSize;
  final Color fontColor;
  final String? text;
  final Widget? icon;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
        border: border,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: callback,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon ?? Container(),
              (icon != null && text != null)
                  ? const SizedBox(width: 12)
                  : const SizedBox(),
              (text != null)
                  ? Text(
                      '$text',
                      style: TextStyle(
                        color: fontColor,
                        fontSize: fontSize,
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
