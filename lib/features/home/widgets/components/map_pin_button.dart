import 'package:ecocoleta/helper/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MapPinButton extends StatelessWidget{


	@override
	Widget build(BuildContext context){

		return FloatingActionButton(
        	onPressed: () {
          		Get.toNamed(RouteHelper.getMapScreen());
        	},
        	backgroundColor: Colors.green,
        	child: const Icon(
          		Icons.location_pin, 
          		size: 32,
          		color: Colors.white
          	),
      	);

	}
}