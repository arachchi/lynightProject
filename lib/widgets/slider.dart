import 'package:flutter/material.dart';
import 'package:lynight/services/crud.dart';
import 'package:lynight/services/userData.dart';

class CustomSlider extends StatefulWidget {
  final String userMail;
  Function signOut;
  final String activePage;

  CustomSlider({this.userMail, this.signOut, this.activePage});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CustomSliderState();
  }
}


class _CustomSliderState extends State<CustomSlider>{

  CrudMethods crudObj = new CrudMethods();
  String name = 'UserName';

  void initState() {
    super.initState();

    crudObj.getDataFromUserFromDocument().then((value){ // correspond à await Firestore.instance.collection('user').document(user.uid).get();
      Map<String,dynamic> dataMap = value.data; // retourne la Map des donné de l'utilisateur correspondant à uid passé dans la methode venant du cruObj
      setState(() {
        name = dataMap['name'];
      });
    });
  }

  Widget header(context) {
    return DrawerHeader(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              child: Text('U'),
            ),
            title: Text(name),
            subtitle: Text(widget.userMail),
          ),
          RaisedButton(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            child: Text(
              'Déconnexion',
              style: TextStyle(
                fontSize: 14.0,
                color: Color(0xFFef0000),
              ),
            ),
            color: Color(0xFFffb2b2),
            textColor: Theme.of(context).primaryColor,
            onPressed: widget.signOut,
          ),
        ],
      ),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Theme.of(context).primaryColor))),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: ListView(
        children: <Widget>[
          header(context),
          Container(
            decoration: widget.activePage == 'Accueil'
                ? BoxDecoration(
                    color: Color(0xFFebdffc),
                    borderRadius: BorderRadius.circular(15.0))
                : BoxDecoration(),
            child: ListTile(
              leading: Icon(
                Icons.home,
                color: widget.activePage == 'Accueil'
                    ? Theme.of(context).primaryColor
                    : Colors.grey,
              ),
              title: Text(
                'Accueil',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: widget.activePage == 'Accueil'
                      ? Theme.of(context).primaryColor
                      : Colors.grey,
                ),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
          ),
          Container(
            decoration: widget.activePage == 'Profil'
                ? BoxDecoration(
                    color: Color(0xFFebdffc),
                    borderRadius: BorderRadius.circular(15.0))
                : BoxDecoration(),
            child: ListTile(
              leading: Icon(
                Icons.account_circle,
                color: widget.activePage == 'Profil'
                    ? Theme.of(context).primaryColor
                    : Colors.grey,
              ),
              title: Text(
                'Profil',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: widget.activePage == 'Profil'
                      ? Theme.of(context).primaryColor
                      : Colors.grey,
                ),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/userProfil');
              },
            ),
          ),
          Container(
            decoration: widget.activePage == 'Reservations'
                ? BoxDecoration(
                    color: Color(0xFFebdffc),
                    borderRadius: BorderRadius.circular(15.0))
                : BoxDecoration(),
            child: ListTile(
              leading: Icon(
                Icons.book,
                color: widget.activePage == 'Reservations'
                    ? Theme.of(context).primaryColor
                    : Colors.grey,
              ),
              title: Text(
                'Réservations',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: widget.activePage == 'Reservations'
                      ? Theme.of(context).primaryColor
                      : Colors.grey,
                ),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/myReservations');
              },
            ),
          ),
          Container(
            decoration: widget.activePage == 'Maps'
                ? BoxDecoration(
                    color: Color(0xFFebdffc),
                    borderRadius: BorderRadius.circular(15.0))
                : BoxDecoration(),
            child: ListTile(
              leading: Icon(
                Icons.streetview,
                color: widget.activePage == 'Maps'
                    ? Theme.of(context).primaryColor
                    : Colors.grey,
              ),
              title: Text(
                'Carte',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: widget.activePage == 'Maps'
                      ? Theme.of(context).primaryColor
                      : Colors.grey,
                ),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/maps');
              },
            ),
          ),
        ],
      ),
    );
  }
}
