import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.data});
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data["name"] ?? "",
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Tooltip(
                triggerMode: TooltipTriggerMode.tap,
                message: data["cost"] ?? "",
                child: const Icon(Icons.attach_money),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 140.0,
                child: Text(
                  "${data["description"] ?? ""}\n위치: ${data["address"] ?? ""}",
                ),
              ),
              SizedBox(
                width: 100.0,
                height: 100.0,
                child: Image.asset(
                  "assets/images/${data["image"] ?? "placeholder.png"}",
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
