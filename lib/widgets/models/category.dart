class Category {

  Category({
    this.title = '',
    this.imagePath = '',
    this.description ='',
    this.type = '',

  });

  String title;
  String imagePath;
  String description;
  String type;

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
      imagePath: 'assets/images/interFace3.png',
      title: 'User interface Design',
    ),
    Category(
      imagePath: 'assets/images/interFace4.png',
      title: 'User Design',
    ),
  ];

  static List<Category> popularCourseList = <Category>[
    Category(
      imagePath: 'assets/images/interFace1.png',
      title: 'One Equation One Unknown',
      description:'This is the very basic equations you can solve it includes only one variable like for Example x + 5 = 12, then the answer of x is equals 7',
      type: 'Basic',
    ),
    Category(
      imagePath: 'assets/images/interFace2.png',
      title: 'Two Equations Two Unknows',
      description:'This tybe of equations is more complex as you have two unknown variables and at least two equations and you try to find the value of the two unknowns from these equations',
      type: 'Two',
    ),
    Category(
      imagePath: 'assets/images/interFace3.png',
      title: 'Second Order Equation',
      description:'Second Order Equations means that the variable is raised to the power two example X^2 = 4 then X will be equal + or - 2 ',
      type: 'Second',
    ),
    Category(
      imagePath: 'assets/images/interFace4.png',
      title: 'Differential Equation',
      description:'This part is under progress :D',
      type: 'Diff',
    ),
  ];
}
