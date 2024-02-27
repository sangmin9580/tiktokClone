import 'package:flutter/material.dart';
import 'package:flutterpractice/constants/sizes.dart';
import 'package:flutterpractice/features/inbox/chat_detail_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatsScreen> {
  final GlobalKey<AnimatedListState> _animatedListkey =
      GlobalKey<AnimatedListState>();

  final List _items = [];

  void _addItem() {
    if (_animatedListkey.currentState != null) {
      _animatedListkey.currentState!.insertItem(_items.length);
      _items.add(_items.length);
    }
  }

  void _onChatLongPressd(int index) {
    if (_animatedListkey.currentState != null) {
      _animatedListkey.currentState!.removeItem(
        index,
        (context, animation) => SizeTransition(
          sizeFactor: animation,
          child: _makeListile(index),
        ),
      );
      _items.removeAt(index);
    }
  }

  void _onChatTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ChatDetailScreen(),
      ),
    );
  }

  Widget _makeListile(int index) {
    return ListTile(
      onLongPress: () => _onChatLongPressd(index),
      onTap: _onChatTap,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Lynn[$index]",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const Text(
            "2:16 PM",
            style: TextStyle(
              color: Colors.black54,
              fontSize: Sizes.size12,
            ),
          ),
        ],
      ),
      subtitle: const Text(
        "Don't forget to make video",
        style: TextStyle(
          color: Colors.black54,
        ),
      ),
      leading: CircleAvatar(
        foregroundColor: Colors.blue.shade400,
        backgroundColor: Colors.blue.shade400,
        child: const Text(
          "상민",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Direct messages"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const FaIcon(
              FontAwesomeIcons.plus,
            ),
          )
        ],
      ),
      body: AnimatedList(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        key: _animatedListkey,
        itemBuilder: (context, index, animation) {
          return FadeTransition(
            key: Key("$index"),
            opacity: animation,
            child: SizeTransition(
              sizeFactor: animation,
              child: _makeListile(index),
            ),
          );
        },
      ),
    );
  }
}
