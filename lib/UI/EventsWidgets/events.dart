import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:isa_new/Helpers/sizeHelpers.dart';
import 'package:isa_new/Screens/TimeTableScreens/EventsToTImeScreen.dart';
import 'package:isa_new/UI/UI.dart';
import 'package:isa_new/api/dateHelpers.dart';
import 'package:isa_new/models/eventsModels/EventModel.dart';

class dayCard extends UIItem {
  DateTime date;
  FontWeight fontweight;
  Color background;
  bool shadow = false;

  dayCard(DateTime date) {
    this.fontweight = FontWeight.w400;
    this.background = UIColors.defaultBackground;
    this.date = date;
  }

  dayCard.selected(DateTime date) {
    this.fontweight = FontWeight.w600;
    this.background = Colors.white;
    this.date = date;
    shadow = true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          right: displayWidth(context) * 0.0123,
          left: displayWidth(context) * 0.0123,
          bottom: displayHeight(context) * 0.03),
      decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(displayWidth(context) * 0.08),
          boxShadow: shadow
              ? [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
          ]
              : null),
      width: displayWidth(context) * 0.12,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(
              top: displayHeight(context) * 0.02,
            ),
            child: Text(
              date.day.toString(),
              style: UITypography.Figma16px(context, weight: fontweight),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: displayWidth(context) * 0.03),
            child: Text(
              shortDay(date.weekday),
              style: UITypography.Figma16px(context, weight: fontweight),
            ),
          ),
        ],
      ),
    );
  }
}

class EventCategoryCard extends UIItem {
  String text;
  Color color;

  EventCategoryCard(this.text, this.color);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          maxHeight: 35,
          maxWidth: 100
      ),
      child: Container(
          height: displayHeight(context) * 0.05,
          width: displayWidth(context) * 0.25,
          padding: EdgeInsets.only(
              bottom: displayHeight(context) * 0.006
          ),
          margin: EdgeInsets.only(right: displayWidth(context) * 0.02),
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(
                  displayWidth(context) * 0.07)),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,

              style: UITypography.h3(context,
                  color: Colors.white, weight: FontWeight.w500),
            ),
          )
      ),
    );
  }
}

class EventListItem extends UIItem {
  EventModel event;

  EventListItem(this.event);

  @override
  Widget build(BuildContext context) {
    return event.name != null
        ? Container(
            height: displayHeight(context) * 0.1,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    getIntervalString(event.dStart, event.dEnd),
                    style: UITypography.h4(context,
                        weight: FontWeight.w500, color: Color(0xff515151)),
                  ),
                ),
                Expanded(
                  flex: 11,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(displayWidth(context) * 0.02),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.25),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: displayWidth(context) * 0.03),
                          child: Column(
                            children: [
                              Container(
                                child: Text(
                                  event.name,
                                  style: UITypography.h3(context),
                                ),
                                constraints: BoxConstraints(
                                    maxWidth: displayWidth(context) * 0.6),
                              ),
                              Container(
                                child: Text(
                                  event.place,
                                  style: UITypography.h4(context),
                                ),
                              )
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                        ),
                        Spacer(),
                        Container(
                          alignment: Alignment.bottomRight,
                          width: displayWidth(context) * 0.01,
                          decoration: BoxDecoration(
                              color: event.type == "lesson"
                                  ? UIColors.yellow
                                  : UIColors.primary,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(
                                    displayWidth(context) * 0.2),
                                bottomRight: Radius.circular(
                                    displayWidth(context) * 0.2),
                              )),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        : GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          EventsToTimeScreen(event.dStart, event.dEnd)));
            },
            child: Container(
              height: displayHeight(context) * 0.08,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      getIntervalString(event.dStart, event.dEnd),
                      style: UITypography.h4(context,
                          weight: FontWeight.w500, color: Color(0xff515151)),
                    ),
                  ),
                  Expanded(
                    flex: 11,
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      radius: Radius.circular(displayWidth(context) * 0.02),
                      padding: EdgeInsets.all(displayHeight(context) * 0.02),
                      dashPattern: [
                        displayWidth(context) * 0.02,
                        displayWidth(context) * 0.02,
                      ],
                      strokeWidth: 2,
                      color: Color(0xffA8A7A7),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              "Добавить",
                              style: UITypography.h3(context,
                                  weight: FontWeight.w500,
                                  color: Color(0xffA8A7A7)),
                            ),
                          ),
                          SvgPicture.asset(
                            ui.icons.plusButton,
                            width: displayWidth(context) * 0.04,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
  }
}

class EventToChoose extends UIItem {
  EventModel event;

  EventToChoose(this.event);

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: [
        Container(
          height: displayHeight(context) * 0.1,
          margin: EdgeInsets.only(
            top: displayHeight(context) * 0.035,
            left: displayWidth(context) * 0.05,
            right: displayWidth(context) * 0.05,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.only(right: displayWidth(context) * 0.02),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            bottom: displayHeight(context) * 0.007),
                        padding: EdgeInsets.all(displayWidth(context) * 0.017),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset:
                                    Offset(0, 2), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(
                                displayWidth(context) * 0.02)),
                        child: Text(
                          "17 января",
                          style: UITypography.h4(context,
                              color: UIColors.yellow, weight: FontWeight.w700),
                        ),
                      ),
                      Container(
                        child: Text(
                          getIntervalString(event.dStart, event.dEnd),
                          style: UITypography.h4(context,
                              weight: FontWeight.w500,
                              color: Color(0xff515151)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 9,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(displayWidth(context) * 0.02),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.25),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.only(left: displayWidth(context) * 0.03),
                        child: Column(
                          children: [
                            Container(
                              child: Text(
                                event.name,
                                style: UITypography.h3(context),
                              ),
                            ),
                            Container(
                              child: Text(
                                event.place,
                                style: UITypography.h4(context),
                              ),
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: -displayHeight(context) * 0.015,
          right: displayWidth(context) * 0.05,
          child: Container(
            padding: EdgeInsets.only(
              top: displayHeight(context) * 0.01,
              bottom: displayHeight(context) * 0.01,
              right: displayWidth(context) * 0.02,
              left: displayWidth(context) * 0.02,
            ),
            decoration: BoxDecoration(
                color: UIColors.semiYellow,
                borderRadius:
                    BorderRadius.circular(displayWidth(context) * 0.03)),
            child: Text(
              "Добавить в расписание",
              style: UITypography.h4(context,
                  color: UIColors.yellow, weight: FontWeight.w700),
            ),
          ),
        )
      ],
    );
  }
}