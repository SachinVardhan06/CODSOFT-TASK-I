import 'package:flutter/material.dart';
import 'package:torch_controller/torch_controller.dart';

class FlashLight extends StatefulWidget {
  const FlashLight({super.key});

  @override
  State<FlashLight> createState() => _FlashLightState();
}

class _FlashLightState extends State<FlashLight> {

  var active = false;
  var controller = TorchController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Flash Light",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(active ? 'assets/Torch_off.png' : 'assets/Torch_off.png',
                  width: 400,
                  height: 450,
                    color: active ? null : Colors.red.withOpacity(0.2),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  CircleAvatar(
                    minRadius: 30,
                    maxRadius: 40,
                    child: Transform.scale(
                      scale: 1.5,
                        child: IconButton(onPressed: (){
                          controller.toggle();
                          active = !active;
                          setState(() {});
                        }, icon: Icon(Icons.power_settings_new),)),
                  )
                ],
              ),
            ),
          )
          ),
          Text(
            "Flash Light App",
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          SizedBox(
            height: size.height * 0.03,
          )
        ],
      ),
    );
  }
}
