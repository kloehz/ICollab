import 'package:flutter/material.dart';
import 'package:i_collab/utils/ui/text_styles.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final _size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              height: _size.height * 0.20,
              child: Row(
                children: [
                  Flexible(
                    flex: 4,
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 6, color: Colors.orange),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/profile/profile_image.jpeg'),
                          )
                        ),
                        width: 110,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 8,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _userInfo(),
                          _buttonsContainer()
                        ],
                      ),
                    )
                  )
                ],
              ),
            ),
            Container(
              height: _size.height * 0.075,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _numbersInfo('4096', 'publicaciones'),
                  SizedBox(width: 10),
                  _numbersInfo('921k', 'seguidores'),
                  SizedBox(width: 10),
                  _numbersInfo('572', 'seguidos'),
                ]
              ),
            ),
            _collaboratedWith()
          ],
        ),
      )
    );
  }

  RichText _collaboratedWith() {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: Colors.grey,
          fontSize: 14
        ),
        children: const [
          TextSpan(text: 'Colaboró con '),
          TextSpan(
            text: 'mariandemarte, kase o, y 28 ',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold
            )
          ),
          TextSpan(text: 'personas más.')
        ]
      )
    );
  }

  Column _numbersInfo(String number, String title) {
    return Column(
      children: [
        Text(
          number,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),
        ),
        Text(
          title,
          style: TextStyle(
            color: Colors.grey,
            overflow: TextOverflow.ellipsis
          )
        )
      ],
    );
  }

  Row _buttonsContainer() {
    return Row(
      children: [
        Expanded(
          child: ButtonTheme(
            minWidth: double.infinity,
            child: ElevatedButton(
              onPressed: (){},
              child: Text(
                'Seguir',
                style: TextStyle(
                  color: Colors.white
                ),
              )
            ),
          ),
        ),
        SizedBox(width: 5),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: Colors.blue,
          ),
          height: 37,
          width: 37,
          child: IconButton(
            icon: Icon(Icons.arrow_drop_down, color: Colors.white),
            onPressed: (){},
          ),
        )
      ],
    );
  }

  Padding _userInfo() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Duende Funk',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                )
              ),
              SizedBox(width:5),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: Icon(Icons.check, color: Colors.white, size: 22),
              )
            ],
          ),
          Row(
            children: const [
              Expanded(
                child: Text(
                  '#rap #lofi #funk #rapero #productor',
                  style: hashStyle,
                ),
              )
            ],
          ),
          Row(
            children: const [
              Text(
                'www.duenterapero.com',
                style: hashStyle,
              )
            ],
          ),
        ],
      ),
    );
  }
}