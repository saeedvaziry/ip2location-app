import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ip2location/domain/entities/ip_info.dart';
import 'package:ip2location/injection_container.dart';
import 'package:ip2location/presentation/home/cubit/ip_info_cubit.dart';
import 'package:ip2location/presentation/home/widgets/flag_widget.dart';

class IpInfoWidget extends StatefulWidget {
  final IpInfoCubit cubit;

  const IpInfoWidget({Key? key, required this.cubit}) : super(key: key);

  @override
  _IpInfoWidgetState createState() {
    return _IpInfoWidgetState();
  }
}

class _IpInfoWidgetState extends State<IpInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.indigo, Colors.indigoAccent],
        ),
        borderRadius: BorderRadiusDirectional.circular(20),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor,
            spreadRadius: 3,
            blurRadius: 10,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      margin: const EdgeInsets.all(20),
      child: BlocBuilder<IpInfoCubit, IpInfoState>(
        bloc: widget.cubit,
        builder: (context, state) {
          if (state is IpInfoLoading || state is IpInfoInitial) {
            return _loading();
          } else if (state is IpInfoLoaded) {
            return _info(state.ipInfo);
          } else if (state is IpInfoFailed) {
            return const Text("error");
          } else {
            return const Text("unknown");
          }
        },
      ),
      // child: ipInfo.loading ? _loading() : _info(snapshot.data as IpInfo),
    );
  }

  Widget _loading() {
    return const Center(
      child: SpinKitDualRing(color: Colors.white60),
    );
  }

  Widget _info(IpInfo ipInfo) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20, bottom: 20),
          child: FlagWidget(
            code: ipInfo.countryCode,
            width: 50,
            height: 50,
          ),
        ),
        _row("IP Version", ipInfo.ipVersion),
        _row("IP Address", ipInfo.ipAddress),
        _row("Latitude", ipInfo.latitude),
        _row("Longitude", ipInfo.longitude),
        _row("Country Name", ipInfo.countryName),
        _row("Country Code", ipInfo.countryCode),
        _row("Time Zone", ipInfo.timeZone),
        _row("Zip Code", ipInfo.zipCode),
        _row("City Name", ipInfo.cityName),
        _row("Region Name", ipInfo.regionName),
      ],
    );
  }

  Widget _row(String title, String value) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
