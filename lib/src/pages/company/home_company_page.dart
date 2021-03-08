import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calendar_timeline/calendar_timeline.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:rw_servicios_app/src/providers/company/company_provider.dart';

class HomePageCompany extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final companyInfo = Provider.of<CompanyProvider>(context);
    final data = companyInfo.getData();
    final colorPrincipal = Theme.of(context).primaryColor;
    

    
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('CLiente1'),
        toolbarHeight: 80.0,
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: <Widget>[
          _calendar(context),
          SizedBox(
            height: 50.0,
          ),
          Text('AREAS'),
          _cardsAreas(),
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }
}

Widget _cardsAreas() {
  return Expanded(
    child: ListView(
      padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
      children: [
        Card(
          child: Column(
            children: [
              ListTile(
                title: Text('Area2'),
                onTap: () {},
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              )
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _calendar(BuildContext context) {
  return CalendarTimeline(
      leftMargin: 10,
      monthColor: Theme.of(context).primaryColor,
      dayColor: Colors.black,
      dayNameColor: Colors.black,
      activeDayColor: Colors.white,
      activeBackgroundDayColor: Theme.of(context).primaryColor,
      dotsColor: Colors.amberAccent,
      selectableDayPredicate: (date) => date.day != 23,
      locale: 'es',
      showYears: true,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020, 1, 1),
      lastDate: DateTime(9999, 31, 12),
      onDateSelected: (date) {
        print('Hola');
      });
}

Widget _bottomNavigationBar(BuildContext context) {
  return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Theme.of(context).primaryColor,
        primaryColor: Colors.amber,
        textTheme:  Theme.of(context).textTheme
        .copyWith( caption: TextStyle( color: Colors.white))


      ),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bug_report_rounded),
            label: '',
          ),
        ],
      ),
      );
}
