import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FAQPage(),
    );
  }
}

class FAQPage extends StatelessWidget {
  final List<Map<String, String>> faqs = [
    {"question": "ما هو تطبيق PopList؟", "answer": "تطبيق يساعد على تنظيم المهام اليومية وزيادة التركيز للأفراد، خاصة المصابين باضطراب ADHD."},
    {"question": "من يمكنه استخدام التطبيق؟", "answer": "جميع الأفراد الذين يسعون إلى تحسين إنتاجيتهم اليومية."},
    {"question": "كيف يعمل التطبيق؟", "answer": "يعمل عن طريق إنشاء قوائم مهام وجدولة الأنشطة بواجهة بسيطة وسهلة الاستخدام."},
    {"question": "ما المكافآت التي يقدمها التطبيق؟", "answer": "يحفز المستخدمين عبر نظام مكافآت يعتمد على إنجاز المهام."},
    {"question": "هل أحتاج للإنترنت؟", "answer": "لا، يمكن استخدام التطبيق بدون اتصال بالإنترنت."},
    {"question": "كيف أعيد تعيين كلمة المرور؟", "answer": "يمكن إعادة تعيينها من خلال إعدادات الحساب."},
    {"question": "هل بياناتي آمنة؟", "answer": "نعم، نحن نستخدم تشفيرًا قويًا لحماية بيانات المستخدمين."},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img4.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Spacer(),
                    Text(
                      "الأسئلة الشائعة",
                      style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  itemCount: faqs.length,
                  itemBuilder: (context, index) {
                    return FAQItem(
                      question: faqs[index]["question"]!,
                      answer: faqs[index]["answer"]!,
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.amber,
        selectedItemColor: Colors.white, // Default selected color
        unselectedItemColor: Colors.white70,
        currentIndex: 3, // Make sure this matches the index of the settings icon
        onTap: (index) {
          // Handle navigation if needed
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white), // Home icon white
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.checklist, color: Colors.white), // Checklist icon white
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.white), // Person icon white
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Colors.blue), // Settings icon blue
            label: "",
          ),
        ],
      ),


    );
  }
}

class FAQItem extends StatefulWidget {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});

  @override
  _FAQItemState createState() => _FAQItemState();
}

class _FAQItemState extends State<FAQItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon( // Move the icon to the left
                    isExpanded ? Icons.remove : Icons.add,
                    color: Colors.black,
                  ),
                  SizedBox(width: 10), // Add some space
                  Expanded( // Ensure proper text alignment
                    child: Text(
                      widget.question,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.right, // Align text to the right
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isExpanded)
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                widget.answer,
                style: TextStyle(fontSize: 14, color: Colors.black87),
                textAlign: TextAlign.right, // Align answer text to the right
              ),
            ),
        ],
      ),
    );
  }
}

