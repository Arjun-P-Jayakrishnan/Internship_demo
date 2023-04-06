import 'package:flutter/material.dart';
import 'package:internship_demo_app/registerPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Wrapper(),
    );
  }
}

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  bool isRegistered=true;
  String user="";




  void toggleRegistered(String userName){
    setState(() {
      isRegistered=!isRegistered;
      user=userName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isRegistered?Scaffold(
        appBar: AppBar(
          leading: ElevatedButton(onPressed: (){}, child: Icon(Icons.keyboard_arrow_left)),
        ),
        body: RegisterPage(toggleRegistered: toggleRegistered)):SignedUp(user: user,);
  }
}

class SignedUp extends StatefulWidget {
  String user;
  SignedUp({required this.user});

  @override
  State<SignedUp> createState() => _SignedUpState();
}

class _SignedUpState extends State<SignedUp> {


  int selectedIndex=0;
  List icons=[[Icons.qr_code,"Scan"],[Icons.vaccines,"Vaccine"],[Icons.calendar_month,"My Bookings"]];
  List icon=[[Icons.local_hospital,"Clinic"],[Icons.electric_car_sharp,"Vaccine"],[Icons.person_outline,"Nurse"]];


  @override
  Widget build(BuildContext context) {
    String user=widget.user;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/backgroundImage.jpg"
            ),
            fit: BoxFit.fill,
          ),
        ),

        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50,),
                ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: Image.asset("assets/profile.jpg",
                        fit: BoxFit.cover,
                        height: 100,
                        width: 50,
                      ),
                    ),
                    title: Text("Hi",style: TextStyle(fontSize: 15),),
                    subtitle: Text("$user !",style: TextStyle(fontSize: 30),),
                    trailing: IconButton(icon: Icon(Icons.notification_add_outlined,size: 30,),onPressed: (){},)
                ),

                SizedBox(height: 50,),

                TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(Icons.search,size: 30,color: Colors.blue,),
                    hintText: "Search",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 3.0,
                        )
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                    height: MediaQuery.of(context).size.height*0.3,
                    width: double.maxFinite,
                    child:ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 1,
                        itemBuilder: (_,index){
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset("assets/image1.jpg"),
                          );
                        })
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    color: selectedIndex==index?Colors.orangeAccent:Colors.grey,
                    width: selectedIndex==index?50:20,
                    height: 5,
                  )),
                ),
                SizedBox(height: 40,),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text("At Your Fingertip",style: TextStyle(fontSize: 25),)
                ),
                SizedBox(height:40,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  height: 100,
                  width:double .infinity,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (_,index) {
                        return Container(
                          width: 120,
                          child: Card(
                            child:Column(
                              children: [
                                Icon(icons[index][0]),
                                Text(icons[index][1])
                              ],
                            ),
                          ),
                        );
                      }
                  ),
                ),
                SizedBox(height:40,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  height: 100,
                  width:double .infinity,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (_,index) {
                        return Container(
                          width: 120,
                          child: Card(
                            child:Column(
                              children: [
                                Icon(icon[index][0]),
                                Text(icon[index][1])
                              ],
                            ),
                          ),
                        );
                      }
                  ),
                )
              ],
            ),
          ),
        ),
      ),

    );
  }
}
