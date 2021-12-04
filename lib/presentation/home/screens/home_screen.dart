import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ip2location/injection_container.dart';
import 'package:ip2location/presentation/home/modals/about_modal.dart';
import 'package:ip2location/presentation/home/cubit/ip_info_cubit.dart';
import 'package:ip2location/core/widgets/button_widget.dart';
import 'package:ip2location/presentation/home/widgets/ip_info_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  final _cubit = serviceLocator<IpInfoCubit>();
  String ipAddress = "";

  @override
  Widget build(BuildContext context) {
    void locate() {
      _cubit.getIpInfo(ipAddress);
    }

    // first call
    locate();

    return SafeArea(
      child: Column(
        children: [
          IpInfoWidget(cubit: _cubit),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TextField(
              textAlign: TextAlign.center,
              autofocus: false,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: 'Enter a valid IP Address',
              ),
              onChanged: (String value) {
                ipAddress = value;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: ButtonWidget(onPressed: () {
              locate();
            }),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RawMaterialButton(
                  child: Image.asset(
                    'assets/logo.png',
                    height: 30,
                  ),
                  onPressed: () {
                    showModalBottomSheet<void>(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return const AboutModal();
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
