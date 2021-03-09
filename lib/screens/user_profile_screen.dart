import 'package:flutter/material.dart';
import 'package:laetus/authentication_service.dart';
import 'package:provider/provider.dart';

class UserProfileScreen extends StatelessWidget {
  final savedColours = [1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/LAETUS_LOGO.png',
          width: 120,
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_sharp),
          color: Colors.black,
          onPressed: () => Navigator.pop(context, false),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              context.read<AuthenticationService>().signOut();
            },
            child: Text("Log Out"),
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffC0C0C0), Color(0xffFFFFFF)],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        height: MediaQuery.of(context).copyWith().size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 20.0),
              child: CircleAvatar(
                backgroundColor: Colors.grey[600],
                minRadius: 65.0,
                child: ClipOval(
                  child: Image(
                    image: AssetImage('assets/images/profile_pic.jpg'),
                    width: 125,
                    height: 125,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 20.0,
                bottom: 20.0,
              ),
              child: Text(
                "Constantine Akritides",
                style: TextStyle(
                  color: Colors.grey[850],
                  fontSize: 20.0,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).copyWith().size.height / 2,
              child: ListView.separated(
                padding: EdgeInsets.all(8),
                itemCount: savedColours.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        child: SizedBox(
                          width: 120,
                          height: 120,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.all(
                                Radius.circular(22),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          child: Text("Red"),
                        ),
                      )
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
