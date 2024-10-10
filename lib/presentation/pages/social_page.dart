import 'package:flutter/material.dart';
import '../layouts/main_layouts.dart';

class SocialPage extends StatelessWidget {
  const SocialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cộng đồng Cây Cảnh'),
          backgroundColor: Colors.green[700],
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return _buildPostCard();
          },
        ),
      ),
    );
  }

  Widget _buildPostCard() {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage('https://picsum.photos/200'),
            ),
            title: Text('Người dùng ${_getRandomName()}'),
            subtitle: Text('${_getRandomTime()} giờ trước'),
          ),
          Image.network(
            'https://picsum.photos/500/300?nature',
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              _getRandomCaption(),
              style: TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.favorite_border, color: Colors.green[700]),
                    SizedBox(width: 4),
                    Text('${_getRandomLikes()}'),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.comment_outlined, color: Colors.green[700]),
                    SizedBox(width: 4),
                    Text('${_getRandomComments()}'),
                  ],
                ),
                Icon(Icons.share, color: Colors.green[700]),
              ],
            ),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }

  String _getRandomName() {
    final names = ['An', 'Bình', 'Cường', 'Dung', 'Em'];
    return names[DateTime.now().microsecond % names.length];
  }

  int _getRandomTime() {
    return DateTime.now().microsecond % 24 + 1;
  }

  String _getRandomCaption() {
    final captions = [
      'Cây cảnh mới của tôi đẹp quá!',
      'Hôm nay trồng thêm vài cây bonsai',
      'Góc vườn nhỏ của tôi sau 1 tháng chăm sóc',
      'Ai có kinh nghiệm chăm sóc cây này không?',
      'Chia sẻ niềm vui: cây của tôi đã ra hoa!'
    ];
    return captions[DateTime.now().microsecond % captions.length];
  }

  int _getRandomLikes() {
    return DateTime.now().microsecond % 1000 + 1;
  }

  int _getRandomComments() {
    return DateTime.now().microsecond % 100 + 1;
  }
}
