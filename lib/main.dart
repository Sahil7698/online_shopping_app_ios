import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Globals/Globals.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => const MyStore(),
    ),
  );
}

class MyStore extends StatefulWidget {
  const MyStore({Key? key}) : super(key: key);

  @override
  State<MyStore> createState() => _MyStoreState();
}

class _MyStoreState extends State<MyStore> {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) {
          return CupertinoPageScaffold(
            child: CupertinoTabScaffold(
              tabBar: CupertinoTabBar(
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.home), label: "Products"),
                  BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.search), label: "Search"),
                  BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.cart), label: "Cart"),
                ],
              ),
              tabBuilder: (context, i) {
                if (i == 0) {
                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Container(
                          height: 140,
                          width: double.infinity,
                          alignment: Alignment.bottomLeft,
                          decoration: const BoxDecoration(
                            color: CupertinoColors.systemGrey6,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(
                              left: 10,
                              bottom: 10,
                            ),
                            child: Text(
                              "Cupertino Store",
                              style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: Globals.ProductsList.map(
                            (e) => Padding(
                              padding: const EdgeInsets.all(10),
                              child: SizedBox(
                                height: 100,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Image.asset(
                                        "${e['Img']}",
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 10,
                                          top: 10,
                                          bottom: 10,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "${e['Title']}",
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              "${e['price']}",
                                              style: const TextStyle(
                                                fontSize: 16,
                                                color:
                                                    CupertinoColors.systemGrey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          Globals.Title = e['Title'];
                                          Globals.Img = e['Img'];
                                          Globals.Price = e['price'];
                                          setState(() {
                                            Map<String, dynamic> myList = {
                                              'Title': Globals.Title,
                                              'Img': Globals.Img,
                                              'price': Globals.Price,
                                            };
                                            Globals.CartList.addAll([myList]);
                                            Globals.TotalPrice +=
                                                int.parse(e['price']);
                                          });
                                        },
                                        child: const Icon(
                                          CupertinoIcons.add,
                                          size: 30,
                                          color: CupertinoColors.activeBlue,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ).toList(),
                        ),
                        Container(
                          height: 100,
                        ),
                      ],
                    ),
                  );
                } else if (i == 1) {
                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 40,
                            left: 15,
                            right: 15,
                          ),
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: CupertinoColors.systemGrey5,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              children: const [
                                Expanded(
                                  child: Icon(
                                    CupertinoIcons.search,
                                    color: CupertinoColors.systemGrey,
                                  ),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Text("Pants"),
                                ),
                                Expanded(
                                  child: Icon(
                                    Icons.cancel,
                                    color: CupertinoColors.systemGrey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          children: Globals.pantList
                              .map(
                                (e) => Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: SizedBox(
                                    height: 100,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Image.asset(
                                            "${e['Img']}",
                                          ),
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 10,
                                              top: 10,
                                              bottom: 10,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  "${e['Title']}",
                                                  style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                Text(
                                                  "${e['price']}",
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    color: CupertinoColors
                                                        .systemGrey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Globals.Title = e['Title'];
                                            Globals.Img = e['Img'];
                                            Globals.Price = e['price'];
                                            setState(
                                              () {
                                                Map<String, dynamic> myList = {
                                                  'Title': Globals.Title,
                                                  'Img': Globals.Img,
                                                  'price': Globals.Price,
                                                };
                                                Globals.CartList.addAll(
                                                    [myList]);
                                                Globals.TotalPrice +=
                                                    int.parse(e['price']);
                                              },
                                            );
                                          },
                                          child: const Expanded(
                                            child: Icon(
                                              CupertinoIcons.add,
                                              size: 30,
                                              color: CupertinoColors.activeBlue,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                        Container(
                          height: 100,
                        ),
                      ],
                    ),
                  );
                } else if (i == 2) {
                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Container(
                          height: 140,
                          width: double.infinity,
                          alignment: Alignment.bottomLeft,
                          decoration: const BoxDecoration(
                            color: CupertinoColors.systemGrey6,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(
                              left: 10,
                              bottom: 10,
                            ),
                            child: Text(
                              "Shopping Cart",
                              style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            children: [
                              Row(
                                children: const [
                                  Icon(
                                    CupertinoIcons.person_alt,
                                    color: CupertinoColors.systemGrey2,
                                    size: 25,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 10,
                                    ),
                                    child: Text(
                                      "Sahil Pipaliya",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: CupertinoColors.systemGrey2,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const Divider(),
                              Row(
                                children: const [
                                  Icon(
                                    Icons.email,
                                    color: CupertinoColors.systemGrey2,
                                    size: 25,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 10,
                                    ),
                                    child: Text(
                                      "sahilpipaliya111@gmail.com",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: CupertinoColors.systemGrey2,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const Divider(),
                              Row(
                                children: const [
                                  Icon(
                                    Icons.location_on,
                                    color: CupertinoColors.systemGrey2,
                                    size: 25,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 10,
                                    ),
                                    child: Text(
                                      "B-82 Shreeji Krupa Soc,Kapodra Char, Rasta",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: CupertinoColors.systemGrey2,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const Divider(),
                              Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: const [
                                        Icon(
                                          CupertinoIcons.clock,
                                          color: CupertinoColors.systemGrey2,
                                          size: 25,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: 10,
                                          ),
                                          child: Text(
                                            "Delivery time",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color:
                                                  CupertinoColors.systemGrey2,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.bottomRight,
                                      child: Text(
                                        "${Globals.Months[Globals.Date_Time.month - 1]} ${Globals.Date_Time.day}, ${Globals.Date_Time.year} ${Globals.Date_Time.hour}:${Globals.Date_Time.minute}",
                                        style: const TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.w600,
                                          color: CupertinoColors.systemGrey,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 200,
                                child: CupertinoDatePicker(
                                  dateOrder: DatePickerDateOrder.dmy,
                                  initialDateTime: DateTime.now(),
                                  use24hFormat: false,
                                  maximumYear: 2100,
                                  minimumYear: 1900,
                                  onDateTimeChanged: (dateTime) {
                                    setState(() {
                                      Globals.Date_Time = dateTime;
                                    });
                                  },
                                ),
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                        Column(
                          children: Globals.CartList.map(
                            (e) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 60,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: CupertinoColors.systemGrey6,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            color: CupertinoColors.systemGrey2,
                                          ),
                                          image: DecorationImage(
                                            image: AssetImage("${e['Img']}"),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 6,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 15,
                                          top: 4,
                                          bottom: 4,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${e['Title']}",
                                              style: const TextStyle(
                                                fontSize: 19,
                                              ),
                                            ),
                                            Text(
                                              "₹ ${e['price']}",
                                              style: const TextStyle(
                                                fontSize: 17,
                                                color:
                                                    CupertinoColors.systemGrey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "₹ ${e['price']}",
                                          style: const TextStyle(
                                            fontSize: 19,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ).toList(),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            top: 10,
                          ),
                          child: Divider(
                            thickness: 2,
                            color: CupertinoColors.black,
                            indent: 200,
                            endIndent: 15,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            top: 10,
                          ),
                          child: Divider(
                            thickness: 2,
                            color: CupertinoColors.black,
                            indent: 200,
                            endIndent: 15,
                          ),
                        ),
                        SizedBox(
                          height: 100,
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    right: 15,
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const Text(
                                        "Shipping 199 ₹",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: CupertinoColors.systemGrey,
                                        ),
                                      ),
                                      Text(
                                        "7% Tax : ${(Globals.TotalPrice * 7) / 100} ₹",
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: CupertinoColors.systemGrey,
                                        ),
                                      ),
                                      Text(
                                        "Total : ${Globals.TotalPrice + 199 + ((Globals.TotalPrice * 7) / 100)} ₹",
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                      ],
                    ),
                  );
                }
                return Container();
              },
            ),
          );
        },
      ),
    );
  }
}
