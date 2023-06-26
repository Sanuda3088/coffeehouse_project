import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Database extends StatefulWidget {
  const Database({super.key});

  @override
  State<Database> createState() => _DatabaseState();
}

class _DatabaseState extends State<Database> {
  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _nameController.text = documentSnapshot['Name'];
      _ageController.text = documentSnapshot['Age'].toString();
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  controller: _ageController,
                  decoration: const InputDecoration(labelText: 'Age'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () async {
                      final String Name = _nameController.text;
                      final String Age = _ageController.text;
                      if (Age != null) {
                        await _users
                            .doc(documentSnapshot!.id)
                            .update({"Name": Name, "Age": Age});
                        _nameController.text = '';
                        _ageController.text = '';
                      }
                    },
                    child: const Text('Update'))
              ],
            ),
          );
        });
  }

  Future<void> _create([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _nameController.text = documentSnapshot['Name'];
      _ageController.text = documentSnapshot['Age'].toString();
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  controller: _ageController,
                  decoration: const InputDecoration(labelText: 'Age'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () async {
                      final String Name = _nameController.text;
                      final String Age = _ageController.text;
                      if (Age != null) {
                        await _users.add({"Name": Name, "Age": Age});
                        _nameController.text = '';
                        _ageController.text = '';
                      }
                    },
                    child: const Text('Create'))
              ],
            ),
          );
        });
  }

  Future<void> _delete(String usersId) async {
    await _users.doc(usersId).delete();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('You have successfully deleted a person')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _create(),
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder(
          stream: _users.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(documentSnapshot['Name']),
                      subtitle: Text(documentSnapshot['Age'].toString()),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () => _update(documentSnapshot),
                                icon: const Icon(Icons.edit)),
                            IconButton(
                                onPressed: () => _delete(documentSnapshot.id),
                                icon: const Icon(Icons.delete))
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
