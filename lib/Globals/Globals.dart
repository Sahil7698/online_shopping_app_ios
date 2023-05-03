class Globals {
  static List<Map<String, dynamic>> ProductsList = [
    {
      'Title': "Allen Solly Shirt ",
      'Img': "assets/images/1.webp",
      'price': "1899",
    },
    {
      'Title': "Polo Shirt",
      'Img': "assets/images/3.jpeg",
      'price': "2099",
    },
    {
      'Title': "Being Human T-Shirt",
      'Img': "assets/images/t1.webp",
      'price': "1799",
    },
    {
      'Title': "Polo T-Shirt",
      'Img': "assets/images/t2.webp",
      'price': "3199",
    },
    {
      'Title': "Allen Solly Shirt",
      'Img': "assets/images/t3.webp",
      'price': "1900",
    },
  ];

  static List<Map<String, dynamic>> pantList = [
    {
      'Title': "Raymond Pant",
      'Img': "assets/images/p1.webp",
      'price': "2599",
    },
    {
      'Title': "Puma Pant",
      'Img': "assets/images/p2.webp",
      'price': "2199",
    },
    {
      'Title': "Polo Pant",
      'Img': "assets/images/p3.jpg",
      'price': "2999",
    },
    {
      'Title': "Zara Pant",
      'Img': "assets/images/p4.jpg",
      'price': "2155",
    },
    {
      'Title': "BlackBerry Pant",
      'Img': "assets/images/p5.png",
      'price': "4500",
    },
  ];

  static DateTime Date_Time = DateTime.now();
  static List<dynamic> Months = [
    "Jan",
    "Feb",
    "Mar",
    "April",
    "May",
    "Jun",
    "July",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];

  static List CartList = [];
  static String? Title;
  static String? Img;
  static String? Price;
  static int TotalPrice = 0;
}
