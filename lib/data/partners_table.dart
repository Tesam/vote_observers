import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vote_observers/domain/models/partner.dart';

class PartnersTable {
  final CollectionReference partnersRef =
  FirebaseFirestore.instance.collection("partners").withConverter<Partner>(
    fromFirestore: (snapshot, _) => Partner.fromJson(snapshot.data()!),
    toFirestore: (partner, _) => partner.toJson(),
  );

  Future<bool> isPartnerExist(id) async {
    return await partnersRef
        .doc(id)
        .get()
        .then((value) => (value.exists) ? true : false);
  }

  Future<Partner> getPartner({required String partnerIdentification}) async {
    final Partner partner =
    (await partnersRef.doc(partnerIdentification).get()).data()! as Partner;

    return partner;
  }

  Future<List<Partner>> getPartnersByIds(
      {required List<dynamic> partnerIdentifications}) async {
    final partners = partnerIdentifications
        .map((partnerIdentification) async => await getPartner(partnerIdentification: partnerIdentification));

    return Future.wait(partners);
  }

  Future<List<Partner>> getPartners({int limit = 50,}) async {
    final List<Partner> operators = (await partnersRef.limit(limit).get())
        .docs
        .map((document) => document.data() as Partner)
        .toList();

    return operators;
  }

  Future<void> getPartnersLength() async {
    final List<Partner> operators = (await partnersRef.get())
        .docs
        .map((document) => document.data() as Partner)
        .toList();

    print(operators.length);
  }

  Future<List<Partner>> getNextPartners(
      {required DocumentSnapshot documentSnapshot, int limit = 50}) async {
    final List<Partner> operators = (await partnersRef.limit(limit)
        .startAfterDocument(
        documentSnapshot)
        .get())
        .docs
        .map((document) => document.data() as Partner)
        .toList();

    return operators;
  }

  Future<DocumentSnapshot> getPartnerDocumentByIdentification(
      {required String partnerIdentification}) async {
    return partnersRef.doc(partnerIdentification).get();
  }

  Future<bool> addPartner(
      {required Partner partner, required String partnerID}) {
    return partnersRef
        .doc(partnerID)
        .set(partner)
        .then((value) => true)
        .catchError((error) => print("Failed to add partner: $error"));
  }

  /*int c = 0;
  Future<void> addPartners() async {
    print("json lenght ${jsonData.length}");
    for (var element in jsonData) {

      Partner partner = Partner.fromJson(element);
      partnersRef
          .doc(partner.identification.toString())
          .set(partner)
          .then((values) async {
        c++;
        print("FIREBASE ADDED ${partner.identification} id = $c");
        if(jsonData.last == element){
          print("ULTIMO ELEMENTO");
        }
        await Future.delayed(Duration(seconds: 10));
      }).catchError((error) => print("Failed to add partner: $error"));
    }

  }*/

}



