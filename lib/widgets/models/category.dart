class Category {
  Category({
    this.title = '',
    this.imagePath = '',

  });

  String title;
  String imagePath;

  static List<Category> categoryList = <Category>[
    Category(
      imagePath: 'assets/images/interFace1.png',
      title: 'User interface Design',
    ),
    Category(
      imagePath: 'assets/images/interFace2.png',
      title: 'User interface Design',
    ),
    Category(
      imagePath: 'assets/images/interFace1.png',
      title: 'User interface Design',
    ),
    Category(
      imagePath: 'assets/images/interFace2.png',
      title: 'User Design',
    ),
  ];

  static List<Category> popularCourseList = <Category>[
    Category(
      imagePath: 'assets/images/interFace3.png',
      title: 'One Equation One Unknown',
    ),
    Category(
      imagePath: 'assets/images/interFace4.png',
      title: 'Two Equations Two Unknows',
    ),
    Category(
      imagePath: 'assets/images/interFace3.png',
      title: 'Differential Equation',
    ),
    Category(
      imagePath: 'assets/images/interFace4.png',
      title: 'Integral Equation',
    ),
  ];
}
