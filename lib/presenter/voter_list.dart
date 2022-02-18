import 'package:flutter/material.dart';

enum VoteStatus { voted, notVoted }

class VoterList extends StatelessWidget {
  const VoterList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1D8233),
        title: const Text("Juan Perez"),
        centerTitle: true,
        bottom: const PreferredSize(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Mesa 1",
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
            preferredSize: Size(double.infinity, 60)),
      ),
      body: GridView.count(
        crossAxisCount: 4,
        children: List.generate(100, (index) {
          return orderContainer(
              index: index,
              context: context,
              voter: "Juanita Perez",
              voteStatus:
                  (index.isOdd) ? VoteStatus.notVoted : VoteStatus.voted);
        }),
      ),
    );
  }

  Widget orderContainer(
          {required int index,
          required String voter,
          VoteStatus voteStatus = VoteStatus.notVoted,
          required BuildContext context}) =>
      InkWell(
        child: Container(
          width: 80.0,
          height: 80.0,
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: (voteStatus == VoteStatus.voted)
                  ? const Color(0xFFBCEEA5)
                  : const Color(0xFFF2F2F2)),
          child: Center(
            child: Text(
              "$index",
              style: TextStyle(
                  color: (voteStatus == VoteStatus.voted)
                      ? const Color(0xFF1D8233)
                      : const Color(0xFF828282),
                  fontSize: 20.0),
            ),
          ),
        ),
        onTap: () => _showMyDialog(context: context, voter: voter),
      );

  Future<void> _showMyDialog({required BuildContext context, required String voter}) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Agregar voto",
            style: TextStyle(color: Color(0xFF1D8233)),
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          content: SingleChildScrollView(
            child: Text('Desea agregar voto de $voter?'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Cancelar',
                style: TextStyle(color: Color(0xFF828282)),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                'Agregar',
                style: TextStyle(color: Color(0xFF1D8233)),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
