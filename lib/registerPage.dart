import 'package:flutter/material.dart';


















class RegisterPage extends StatefulWidget {
 Function toggleRegistered;

 RegisterPage({required this.toggleRegistered});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final _keyForm=GlobalKey<FormState>();

  String name="";
  String email="";
  String gender="M";
  String practice_from_month="";
  String practice_frm_year="";

  List genders=["Male","Female","Others"];
  List data=[];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _keyForm,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              LinearProgressIndicator(
                value: 0.5,
                color: Colors.orangeAccent,
              ),
              SizedBox(height: 20,),
              Text("2/4"),
              SizedBox(height: 20,),
              Text("Basic Details",style: TextStyle(fontSize: 30),),
              SizedBox(height: 20,),
              Text("Free free to fill details"),
              SizedBox(height: 20,),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Full Name")),
              SizedBox(height: 20,),
              TextFormField(
                onChanged: (val){
                  setState(() {
                    name=val;
                  });
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(Icons.search,size: 30,color: Colors.blue,),
                  hintText: "Full Name",
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
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Email")),
              SizedBox(height: 20,),
              TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(Icons.search,size: 30,color: Colors.blue,),
                  hintText: "Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 3.0,
                      )
                  ),
                ),
                onChanged: (val){
                  setState(() {
                   email=val;
                  });
                },
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(3, (index) => OutlinedButton(onPressed: (){
                  String genderCharacter=genders[index][0] ?? 'M';
                  print("gneders is $genderCharacter");
                  setState(() {
                    gender=genderCharacter;
                    print(gender);
                  });
                }, child: Text("${genders[index]}"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(index==0?Colors.orangeAccent:Colors.transparent),
                    shape: MaterialStatePropertyAll<RoundedRectangleBorder>(RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    )),
                  ),

                ),

                ),
              ),
              SizedBox(height: 20,),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Practicing From")),
              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 40,
                    width: 150,
                    child: TextFormField(
                      decoration:  InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Month",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 3.0,
                            )
                        ),
                      ),
                      onChanged: (val){
                        setState(() {
                          practice_from_month=val;
                        });
                      },
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 150,
                    child: TextFormField(
                      decoration:  InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Year",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 3.0,
                            )
                        ),
                      ),
                      onChanged: (val){
                        setState(() {
                          practice_frm_year=val;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 100,),
                  ElevatedButton(onPressed: () {
                    print("this is the details $name $email $gender $practice_from_month $practice_frm_year");
                    data=[["Name:",name],["Email:",email],["Gender:",gender],["Prctise_frm_month",practice_from_month],["practice_frm_year",practice_frm_year]];
                    showDialog(context: context, builder: (BuildContext context) {
                      
                      return Container(
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(data.length, (index) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(data[index][0]),
                              Text("${data[index][1]}"),
                            ],
                          )),
                        ),
                      );
                    },


                    );


                  }, child: Icon(Icons.arrow_forward_outlined,color: Colors.blue,size: 20,),
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                    shape: MaterialStatePropertyAll<RoundedRectangleBorder>(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))
                    )),
                  ),


                  )
            ],
          ),
        ),
      ),
    );
  }
}
