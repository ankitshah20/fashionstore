import 'package:flutter/material.dart';

var profile =
    "https://pagesix.com/wp-content/uploads/sites/3/2023/01/kate-middleton-22.jpg?quality=80&strip=all&w=878";

List populars = [
  {
    "image":
        "https://luxus-plus.com/wp-content/uploads/2022/06/push-cover-defile-fashion-week-homme-paris-printemps-ete-2021-digital-numerique-covid-19-numero-magazine-1024x506.jpg",
    "name": "Boys Outfit",
    "price": "\$80k",
    "location": "Kathmandu, Dilibazar",
    "is_favorited": true,
  },
  {
    "image":
        "https://sveltemag.com/ezoimgfmt/i0.wp.com/sveltemag.com/wp-content/uploads/2019/07/latest-ankara-styles-1.jpg?resize=300%2C169&ssl=1&ezimgfmt=ng:webp/ngcb7",
    "name": "Girls Outfit",
    "price": "\$50k",
    "location": "Kathmandu, Dilibazar",
    "is_favorited": false,
  },
  {
    "image":
        "https://stylecaster.com/wp-content/uploads/2022/09/fashionweektrends.png?w=960&h=540&crop=1",
    "name": "Girls Outfit",
    "price": "\$175k",
    "location": "Kathmandu, Dilibazar",
    "is_favorited": false,
  },
  {
    "image":
        "https://modernteen.co/wp-content/uploads/2022/12/outfits-for-teenage-girls-800x500.jpg",
    "name": "Girls Outfit",
    "price": "\$100k",
    "location": "Kathmandu, Dilibazar",
    "is_favorited": false,
  },
];

List recommended = [
  {
    "image":
        "https://images.unsplash.com/photo-1652108993544-cf98d5eb1893?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=464&q=80",
    "name": "Girls Antique",
    "price": "\$180k",
    "location": "Dilibazar, FashionStore",
    "is_favorited": true,
  },
  {
    "image":
        "https://media.istockphoto.com/id/803960410/photo/girl-listening-to-music.jpg?s=2048x2048&w=is&k=20&c=XBOBOhq2tU6lWZDuvnrO-uD2E7RQ3rnXhj_D8gtOO5E=",
    "name": " Girl Modern Summer Outfit",
    "price": "\$175k",
    "location": "Dilibazar, FashionStore",
    "is_favorited": false,
  },
  {
    "image":
        "https://images.unsplash.com/photo-1574502482076-933de46e26eb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80",
    "name": "Boys Outfit",
    "price": "\$180k",
    "location": "Dilibazar, FashionStore",
    "is_favorited": true,
  },
];

List recents = [
  {
    "image":
        "https://images.unsplash.com/photo-1495385794356-15371f348c31?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1940&q=80",
    "name": "Girls Summer collection",
    "price": "\$180k",
    "location": "Dilibazar, FashionStore",
    "is_favorited": false,
  },
  {
    "image":
        "https://i0.wp.com/sveltemag.com/wp-content/uploads/2022/01/frugal-male-fashion.jpg?fit=1200%2C676&ssl=1",
    "name": "Boys Summer Outfit",
    "price": "\$150k",
    "location": "Dilibazar, FashionStore",
    "is_favorited": false,
  },
  {
    "image":
        "https://luxus-plus.com/wp-content/uploads/2022/06/push-cover-defile-fashion-week-homme-paris-printemps-ete-2021-digital-numerique-covid-19-numero-magazine-1024x506.jpg",
    "name": "Boys Summer Outfit",
    "price": "\$180k",
    "location": "Dilibazar, FashionStore",
    "is_favorited": false,
  },
];

var brokers = [
  {
    "image":
        "https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjV8fHByb2ZpbGV8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "John Siphron",
    "type": "Broker",
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
    "rate": 4,
  },
  {
    "image":
        "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fHByb2ZpbGV8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Corey Aminoff",
    "type": "Broker",
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
    "rate": 4,
  },
  {
    "image":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgYHevF45Srq3GZBluLnkycZdTjOd07Zri_lM4DFYqcKDDpzWOlyw1s5TYYH05QjQpWr0&usqp=CAU",
    "name": "Siriya Aminoff",
    "type": "Broker",
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
    "rate": 4,
  },
  {
    "image":
        "https://pagesix.com/wp-content/uploads/sites/3/2023/01/kate-middleton-22.jpg?resize=1956,1304",
    "name": "Rubin Joe",
    "type": "Broker",
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
    "rate": 4,
  },
];

List companies = [
  {
    "image":
        "https://images.unsplash.com/photo-1549517045-bc93de075e53?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "TS Home",
    "location": "Phnom Penh, Cambodia",
    "type": "Broker",
    "is_favorited": false,
    "icon": Icons.domain_rounded
  },
  {
    "image":
        "https://images.unsplash.com/photo-1618221469555-7f3ad97540d6?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Century 21",
    "location": "Phnom Penh, Cambodia",
    "type": "Broker",
    "is_favorited": true,
    "icon": Icons.house_siding_rounded
  },
  {
    "image":
        "https://images.unsplash.com/photo-1625602812206-5ec545ca1231?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Dabest Pro",
    "location": "Phnom Penh, Cambodia",
    "type": "Broker",
    "is_favorited": true,
    "icon": Icons.home_work_rounded
  },
  {
    "image":
        "https://images.unsplash.com/photo-1625602812206-5ec545ca1231?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Cam Reality",
    "location": "Phnom Penh, Cambodia",
    "type": "Broker",
    "is_favorited": true,
    "icon": Icons.location_city_rounded
  },
];




