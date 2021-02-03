import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:isa_new/Helpers/sizeHelpers.dart';
import 'package:isa_new/UI/UI.dart';
import 'package:isa_new/UI/UIHelpers.dart';
import 'package:isa_new/api/dateHelpers.dart';
import 'package:isa_new/blocs/EventsBloc.dart';
import 'package:isa_new/models/eventsModels/EventModel.dart';

class EventsToTimeScreen extends UIItem {
  DateTime from;
  DateTime to;

  EventsToTimeScreen(this.from, this.to) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.defaultBackground,
      body: StreamBuilder(
          stream: eventsBloc.events,
          builder: (context, AsyncSnapshot<List<EventModel>> snapshot) {
            if (snapshot.hasData) {
              return Container(
                child: ListView(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: displayHeight(context) * 0.02,
                              left: displayWidth(context) * 0.03),
                          child: backButton(),
                        ),
                        Spacer(),
                        Container(
                          margin: EdgeInsets.only(
                              top: displayHeight(context) * 0.012),
                          child: Text(
                            "Мероприятия",
                            style: UITypography.h1(context),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(displayWidth(context) * 0.02),
                      margin: EdgeInsets.only(
                        top: displayHeight(context) * 0.02,
                        left: displayWidth(context) * 0.38,
                        right: displayWidth(context) * 0.38,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                              displayWidth(context) * 0.02)),
                      child: Column(
                        children: [
                          Text(
                            "6 января",
                            style: UITypography.h4(context,
                                color: UIColors.yellow,
                                weight: FontWeight.w600),
                          ),
                          Text(
                            getIntervalString(from, to),
                            style: UITypography.h4(context,
                                color: UIColors.yellow,
                                weight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            displayWidth(context) * 0.015),
                        color: UIColors.defaultBackground,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(0, 0), // changes position of shadow
                          ),
                        ],
                      ),
                      margin: EdgeInsets.only(
                          top: displayHeight(context) * 0.024,
                          left: displayWidth(context) * 0.05,
                          right: displayWidth(context) * 0.05,
                          bottom: displayHeight(context) * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var event in snapshot.data)
                            Stack(
                              overflow: Overflow.visible,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: displayHeight(context) * 0.08,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                              displayWidth(context) * 0.02),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.25),
                                              spreadRadius: 2,
                                              blurRadius: 3,
                                              offset: Offset(0,
                                                  0), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        margin: EdgeInsets.only(
                                          left: displayWidth(context) * 0.03,
                                          right: displayWidth(context) * 0.03,
                                          top: displayHeight(context) * 0.02,
                                          bottom: displayHeight(context) * 0.02,
                                        ),
                                        padding: EdgeInsets.only(
                                          left: displayWidth(context) * 0.03,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              child: Text(
                                                "Быстрее, Выше, Сильнее",
                                                style: UITypography.h3(context),
                                                textAlign: TextAlign.left,
                                              ),
                                            ),
                                            Container(
                                              child: Text(
                                                "стадион",
                                                style: UITypography.h4(context),
                                                textAlign: TextAlign.left,
                                              ),
                                            ),
                                          ],
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Positioned(
                                  bottom: -displayHeight(context) * 0,
                                  right: displayWidth(context) * 0.03,
                                  child: Container(
                                    padding: EdgeInsets.only(
                                      top: displayHeight(context) * 0.01,
                                      bottom: displayHeight(context) * 0.01,
                                      right: displayWidth(context) * 0.02,
                                      left: displayWidth(context) * 0.02,
                                    ),
                                    decoration: BoxDecoration(
                                        color: UIColors.semiYellow,
                                        borderRadius: BorderRadius.circular(
                                            displayWidth(context) * 0.03)),
                                    child: Text(
                                      "Добавить",
                                      style: UITypography.h4(context,
                                          color: UIColors.yellow,
                                          weight: FontWeight.w700),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          Container(
                            height: displayHeight(context) * 0.03,
                            width: 1,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            eventsBloc.clearList();
            eventsBloc.getAll(from, to);
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
