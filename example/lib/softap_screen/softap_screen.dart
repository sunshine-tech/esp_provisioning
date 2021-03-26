import 'package:esp_provisioning_example/softap_screen/softap_bloc.dart';
import 'package:esp_provisioning_example/softap_screen/softap_event.dart';
import 'package:esp_provisioning_example/softap_screen/softap_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SoftApScreen extends StatefulWidget {
  @override
  _SoftApScreenState createState() => _SoftApScreenState();
}

class _SoftApScreenState extends State<SoftApScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text('Scanning BLE devices'),
      ),
      body: BlocProvider(
        create: (BuildContext context) => SoftApBloc(),
        child: BlocBuilder<SoftApBloc, SoftApState>(
          builder: (BuildContext context, SoftApState state) {
            if (state is SoftApStateLoaded) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(4.0),
                      width: MediaQuery.of(context).size.width * 0.85,
                      child:Text('Please connect WiFi to Subol_Gas_Sensor_ in "Wi-Fi Settings". Once you complete it please click Ready button.',
                      style: TextStyle(fontSize: 18),),
                    ),

                    SizedBox(height: MediaQuery.of(context).size.width * 0.1,),
                    MaterialButton(
                      color: Colors.redAccent,
                      elevation: 5,
                      padding: EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => SoftApScreen()));
                      },
                      child: Text(
                        'Ready',
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                )

              );
            }

            return Center(
              child: SpinKitRipple(color: Theme.of(context).textSelectionColor),
            );
          },
        ),
      ),
    );
  }
}