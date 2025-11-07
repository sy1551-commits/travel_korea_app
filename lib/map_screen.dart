import 'package:flutter/material.dart';
import 'detail_screen.dart';

const List<String?> cityList = [
  null, "강릉", "서울", "춘천", "인천", "안동",
  "전주", "경주", "나주", "부산", null, null, "제주",
];

class MapScreen extends StatefulWidget {
  const MapScreen({super.key, required this.info});
  final Map<String, dynamic> info; // ↑ 상위에서 받은 info

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("지역을 선택하세요")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
              padding: const EdgeInsets.only(top: 30, left: 80, right: 80),
              height: 700,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/map.png"),
                ),
              ),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 5, crossAxisSpacing: 45,
                ),
                itemCount: cityList.length,
                itemBuilder: (context, index) => cityList[index] != null
                    ? InkWell(
                        onTap: () {
                          final city = cityList[index]!;
                          final list = widget.info[city] as List<dynamic>?;
                          if (list == null) {
                            // (책엔 없지만 충돌 방지용 안내)
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('$city 데이터가 없습니다.')),
                            );
                            return;
                          }
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => DetailScreen(
                                city: city,
                                info: list,
                              ),
                            ),
                          );
                        },
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: [
                              const Color(0x77F44336),
                              const Color(0x77FFEB3B),
                              const Color(0x772196F3),
                              const Color(0x774CAF50),
                              const Color(0x779C27B0),
                            ][index % 5],
                          ),
                          child: Center(
                            child: Text(cityList[index]!, style: const TextStyle(fontSize: 20)),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
