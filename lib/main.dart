import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';

void main(){
	SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
	runApp(MyApp());
}

TextStyle titleStyle = GoogleFonts.poppins(color: Colors.lightGreen, fontSize: 30);
TextStyle mainStyle = TextStyle(fontSize: 20, color: Colors.lightGreen);
TextStyle mainStyleBold = TextStyle(fontSize: 20, color: Colors.lightGreen, fontWeight: FontWeight.bold);
TextStyle mainStyleWhite = TextStyle(fontSize: 24, color: Colors.white);
ThemeData mainTheme = ThemeData(primarySwatch: Colors.lightGreen);

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Green Hat',
			home: Home(title: 'Green Hat'),
			theme: mainTheme,
			debugShowCheckedModeBanner: false,
		);
	}
}

class Home extends StatefulWidget {
	Home({Key key, this.title}) : super(key: key);

	final String title;

	@override
	HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
	String barcodeNum = "";

	Future<String> scan() async {
		String code = await BarcodeScanner.scan();
		setState(() {
		  barcodeNum = code;
		});
		return code;
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: Center(
				child: Column(
					mainAxisAlignment: MainAxisAlignment.spaceEvenly,
					mainAxisSize: MainAxisSize.max,
					children: <Widget>[
						Image(
							image: NetworkImage("https://media.discordapp.net/attachments/672077470467489803/685703455808946292/greenhat_logo_white.png?width=578&height=578"),
							width: 300,

						),

						Container(
							child: Column(
								children: <Widget>[
									SizedBox(
										width: 250,
										height: 70,
										child: RaisedButton(
											shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
											onPressed: () async {
												barcodeNum = await scan();
												Navigator.push(context, Info(barcodeNum));
											},
											color: Colors.lightGreen,
											child: Text("Scan Barcode", style: mainStyleWhite),
										),
									),
									Padding(
										padding: EdgeInsets.only(top: 20),
										child: Text("Barcode number: " + barcodeNum),
									)
								],
							),
						),

					],
				),
			)


		);
	}
}

class Info extends MaterialPageRoute<Null> {

	Info (String barcode) : super(builder: (BuildContext context) {

		return Scaffold(
			appBar: AppBar(),
			body: getPage(barcode)
		);
	}
	);
}

Widget getPage (String barcode){
	if (barcode == "9420015001204"){
		return SoapBoxPage();
	} else if (barcode == "667888121984"){
		return HatPage();
	} else if (barcode == "068274000218"){
		return BottlePage();
	}
	return Text("bruh");
}

class SoapBoxPage extends StatelessWidget {
	@override
    Widget build(BuildContext context) {
		return ListView(
			children: <Widget>[
				Container(
					padding: EdgeInsets.all(10),
					child: Column(
						children: <Widget>[
							Text("EcoStore Lemongrass Soap 80g", style: titleStyle,),
							Image(
								image: NetworkImage("https://i1.wp.com/www.redbasket.co.nz/wp-content/uploads/2019/09/lemongrass-soap-4pk.png?w=510&ssl=1"),
							),
							Padding(padding: EdgeInsets.only(top: 20),),
							Text("Green score: 9.3/10", style: mainStyle,),
							Padding(padding: EdgeInsets.only(top: 20),),
							Text("Product Summary", style: titleStyle,),
							Padding(padding: EdgeInsets.only(top: 20),),
							Text("-Ethically made and sourced\n-Not tested on animals\n-Plant-derived\n-Contains no harmful chemicals",
								style: mainStyle,
							),
							Padding(padding: EdgeInsets.only(top: 20),),
							Text("Customer Reviews", style: titleStyle),
							Padding(padding: EdgeInsets.only(top: 20),),

							Text("Peter Griffinski",
								style: mainStyleBold,
							),
							Text("\"It feels nice and clean, clean for the environment that is! I love this soap.\" 9.8/10",
								style: mainStyle,
							),
							Padding(padding: EdgeInsets.only(top: 20),),
							Text("Chris Thompy-Thomp",
								style: mainStyleBold,
							),
							Text("\"This soap smells like heaven. It has no harmful chemicals so I can sniff it all day.\" 8/10",
								style: mainStyle,
							),
							Padding(padding: EdgeInsets.only(top: 20),),
							Text("Alex Scubaboi",
								style: mainStyleBold,
							),
							Text("\"This soap is freakin' epic!\" 10/10",
								style: mainStyle,
							),

						],
					),
				),
			],
		);
  }
}

class HatPage extends StatelessWidget {
	@override
  Widget build(BuildContext context) {
    return

	    ListView(
		    children: <Widget>[
	            Container(
		            padding: EdgeInsets.all(10),

	                child: Column(
		                children: <Widget>[
		                    Text("Green Derby Hat", style: titleStyle,),
							Image(
								image: NetworkImage("https://images-na.ssl-images-amazon.com/images/I/71mFGGtxfqL._AC_SX425_.jpg"),
							),
							Padding(padding: EdgeInsets.only(top: 20),),
							Text("Green score: 4.0/10", style: mainStyle,),
			                Padding(padding: EdgeInsets.only(top: 20),),
							Text("Product Summary", style: titleStyle,),
			                Padding(padding: EdgeInsets.only(top: 20),),
							Text("-Made in China, potentially in an unethical way\n-Contains harmful chemicals\n-Not biodegradable",
								style: mainStyle,
							),
			                Padding(padding: EdgeInsets.only(top: 20),),
			                Text("Customer Reviews", style: titleStyle),
			                Padding(padding: EdgeInsets.only(top: 20),),

			                Text("Joe Swansans",
				                style: mainStyleBold,
			                ),
			                Text("\"It feels good on my head but not for the environment\" 4/10",
				                style: mainStyle,
			                ),
			                Padding(padding: EdgeInsets.only(top: 20),),
		                    Text("Cornelius Jonesworth",
					            style: mainStyleBold,
				            ),
						    Text("\"It's coloured green, so shouldn't it be more green?\" 1/10",
							    style: mainStyle,
						    ),
			                Padding(padding: EdgeInsets.only(top: 20),),
			                Text("Bobby Long-Johns",
				                style: mainStyleBold,
			                ),
			                Text("\"This hat is swag\" 10/10",
				                style: mainStyle,
			                ),

		                ],
	                ),
	            )
		    ],
	    );
  }
}

class BottlePage extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return
			ListView(
				children: <Widget>[
					Container(
						padding: EdgeInsets.all(10),
						child: Column(
							children: <Widget>[
								Text("Nestle Pure Life Spring Water 500mL", style: titleStyle,),
								Image(
									image: NetworkImage("https://www.nestle.com/sites/default/files/styles/brand_image/public/asset-library/publishingimages/brands/bottled-water/brands-pure-life-bottle.jpg?itok=RKb1OzaT"),
								),
								Padding(padding: EdgeInsets.only(top: 20),),
								Text("Green score: 2.4/10", style: mainStyle,),
								Padding(padding: EdgeInsets.only(top: 20),),
								Text("Product Summary", style: titleStyle,),
								Padding(padding: EdgeInsets.only(top: 20),),
								Text("-Non-reusable bottles lead to increased plastic waste. It is recommended to use reusable bottles\n-Nestle known for recent water theft from Indigenous peoples\n-Bottle not biodegradable",
									style: mainStyle,
								),
								Padding(padding: EdgeInsets.only(top: 20),),
								Text("Customer Reviews", style: titleStyle),
								Padding(padding: EdgeInsets.only(top: 20),),

								Text("Peter Beter",
									style: mainStyleBold,
								),
								Text("\"Personally, I never saw the point of bottled water. I think water should be liberated.\" 4/10",
									style: mainStyle,
								),
								Padding(padding: EdgeInsets.only(top: 20),),
								Text("Dre Beadz",
									style: mainStyleBold,
								),
								Text("\"I hate this water\" 1/10",
									style: mainStyle,
								),
								Padding(padding: EdgeInsets.only(top: 20),),
								Text("Eugene Krabs",
									style: mainStyleBold,
								),
								Text("\"It tastes okay but I think the environment tastes better\" 10/10",
									style: mainStyle,
								),

							],
						),
					)
				],
			);
	}
}