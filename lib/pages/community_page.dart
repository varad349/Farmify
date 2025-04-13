import 'package:flutter/material.dart';

const kGreenColor = Color(0xFF285429);

class CommunityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Forum',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ForumPage(),
    );
  }
}

class ForumPage extends StatefulWidget {
  @override
  _ForumPageState createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  String _selectedSortOption = 'Newest';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community', style: TextStyle(color: Colors.white)),
        backgroundColor: kGreenColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          DropdownButton<String>(
            value: _selectedSortOption,
            icon: Icon(Icons.sort),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.white),
            onChanged: (String? newValue) {
              setState(() {
                _selectedSortOption = newValue!;
              });
            },
            items: <String>['Newest', 'Oldest', 'Most Upvoted', 'Most Commented']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return PostWidget(post: posts[index]);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: kGreenColor,
      ),
    );
  }
}

class Post {
  final String title;
  final String content;
  int likes;
  final List<Comment> comments;

  Post({
    required this.title,
    required this.content,
    required this.likes,
    required this.comments,
  });
}

class Comment {
  final String author;
  final String text;

  Comment({required this.author, required this.text});
}

class PostWidget extends StatefulWidget {
  final Post post;

  PostWidget({required this.post});

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool _isLiked = false;
  bool _showComments = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.post.title,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: kGreenColor,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            SizedBox(height: 8.0),
            Text(widget.post.content),
            SizedBox(height: 8.0),
            Divider(color: kGreenColor),
            SizedBox(height: 8.0),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      _isLiked = !_isLiked;
                      if (_isLiked) {
                        widget.post.likes++;
                      } else {
                        widget.post.likes--;
                      }
                    });
                  },
                  icon: Icon(
                    _isLiked ? Icons.thumb_up : Icons.thumb_up_outlined,
                    color: _isLiked ? Colors.blue : null,
                  ),
                ),
                Text(
                  '${widget.post.likes} Likes',
                  style: TextStyle(color: kGreenColor),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _showComments = !_showComments;
                    });
                  },
                  icon: Icon(
                    _showComments ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  ),
                ),
                SizedBox(width: 4.0),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _showComments = !_showComments;
                    });
                  },
                  icon: Icon(Icons.message),
                ),
              ],
            ),
            if (_showComments)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.post.comments.map((comment) {
                  return Text(
                    '${comment.author}: ${comment.text}',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  );
                }).toList(),
              ),
          ],
        ),
      ),
    );
  }
}

List<Post> posts = [
  Post(
    title: 'How to get started with Flutter?',
    content: 'I am new to Flutter and want to learn how to get started. Any tips?',
    likes: 5,
    comments: [
      Comment(author: 'John', text: 'Check out the official Flutter documentation.'),
      Comment(author: 'Alice', text: 'You can also find many tutorials on YouTube.'),
    ],
  ),
  Post(
    title: 'Best practices for state management in Flutter?',
    content: 'What are some recommended state management techniques in Flutter?',
    likes: 10,
    comments: [
      Comment(author: 'Bob', text: 'You can use Provider for simple state management.'),
      Comment(author: 'Emma', text: 'Redux is a popular choice for managing complex state.'),
    ],
  ),
];

void main() {
  runApp(CommunityPage());
}
