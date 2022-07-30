
import 'package:flutter/src/widgets/framework.dart';
import 'package:rabbittask/HomeScreen/home_controller.dart';

import '../Exports.dart';
import '../userdeatails/user_information_data.dart';


class HomeScreen extends GetView<HomeController> {


  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("User List"),
      ),

      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [

              TextFormField(
                maxLines: 1,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(10),
                  hintText:
                  "Search user",
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color(0xFF066882),
                    size: 18,
                  ),
                ),

                onChanged: (value) {
                 if(value.isNotEmpty){
                   controller.searchQuery(value);
                 }else{
                   controller.getUsers();
                 }
                },
              ),
              controller.obx((data) =>
            ListView.builder(
            itemCount: data.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {

                  controller.selecteditem = index;
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserProfileDateView()));


                },
              child:Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  height: 170,
                  width: width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage("${data[index].profileImage}"),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 150,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("${data[index].name}",
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("${data[index].email}",
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("${data[index].phone}",
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),

                                ],
                              ),

                            ),
                          ),


                        ],
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child:Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text("More Details",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),);
            },) )
            ],
          ),
        ),
      ),
    );
  }
}