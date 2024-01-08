import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fromto/app/cubit_app/states.dart';
import 'package:fromto/app/shared.dart';
import 'package:fromto/domain/submitted_table.dart';
import 'package:fromto/domain/table_model.dart';
import 'package:intl/intl.dart';


class CubitApp extends Cubit<CubitAppStates> {
  CubitApp() : super(InitCubitAppStates());

  static CubitApp get(context) => BlocProvider.of(context);

  //DashBoard Model

  //LIST TABLE MODEL
  List<TableModel> tablesRow = [
    TableModel(
        inquiryNo: "111111111",
        inquiryDescription: "Air Frieght,350",
        offers: [
          "3500/4.0",
          "4900/3.0",
          "5600/5.0",
        ]),
    TableModel(
        inquiryNo: "111111111",
        inquiryDescription: "Air Frieght,350",
        offers: [
          "3500/4.0",
          "4900/3.0",
          "5600/5.0",
        ]),
    TableModel(
        inquiryNo: "111111111",
        inquiryDescription: "Air Frieght,350",
        offers: [
          "3500/4.0",
          "4900/3.0",
          "5600/5.0",
        ]),
    TableModel(
        inquiryNo: "111111111",
        inquiryDescription: "Air Frieght,350",
        offers: [
          "3500/4.0",
          "4900/3.0",
          "5600/5.0",
        ]),
    TableModel(
        inquiryNo: "111111111",
        inquiryDescription: "Air Frieght,350",
        offers: [
          "3500/4.0",
          "4900/3.0",
          "5600/5.0",
        ]),
    TableModel(
        inquiryNo: "111111111",
        inquiryDescription: "Air Frieght,350",
        offers: [
          "3500/4.0",
          "4900/3.0",
          "5600/5.0",
        ]),
    TableModel(
        inquiryNo: "111111111",
        inquiryDescription: "Air Frieght,350",
        offers: [
          "3500/4.0",
          "4900/3.0",
          "5600/5.0",
        ]),
    TableModel(
        inquiryNo: "111111111",
        inquiryDescription: "Air Frieght,350",
        offers: [
          "3500/4.0",
          "4900/3.0",
          "5600/5.0",
        ]),
    TableModel(
        inquiryNo: "111111111",
        inquiryDescription: "Air Frieght,350",
        offers: [
          "3500/4.0",
          "4900/3.0",
          "5600/5.0",
        ]),
    TableModel(
        inquiryNo: "111111111",
        inquiryDescription: "Air Frieght,350",
        offers: [
          "3500/4.0",
          "4900/3.0",
          "5600/5.0",
        ]),
    TableModel(
        inquiryNo: "111111111",
        inquiryDescription: "Air Frieght,350",
        offers: [
          "3500/4.0",
          "4900/3.0",
          "5600/5.0",
        ]),
    TableModel(
        inquiryNo: "111111111",
        inquiryDescription: "Air Frieght,350",
        offers: [
          "3500/4.0",
          "4900/3.0",
          "5600/5.0",
        ]),
    TableModel(
        inquiryNo: "111111111",
        inquiryDescription: "Air Frieght,350",
        offers: [
          "3500/4.0",
          "4900/3.0",
          "5600/5.0",
        ]),
  ];

  //load more
  bool loadMore = false;
  bool showButtonLoadMore = false;

  void changeLoadMoreStates() {
    loadMore = !loadMore;
    emit(ChangeLoadMoreStates());
  }

  void loadMoreShow() {
    if (tablesRow.length > 7) {
      showButtonLoadMore = true;
    }
    emit(ChangeShowButtonLoadMoreStates());
  }

//Select From
  String? selectFrom;
  List<String> fromList = ['A', 'B', 'C', 'D'];

  SelectFrom isSelectFrom = SelectFrom.firstTime;

  //Shipping Method Widget
  void onchangeFromList(String value) {
    selectFrom = value;
    isSelectFrom = SelectFrom.select;
    emit(ChangeDropList());
  }

  //Select To
  String? selectedTo;

  SelectTo isSelectTo = SelectTo.firstTime;
  List<String> toList = ['A', 'B', 'C', 'D'];

  void onchangeToList(String value) {
    isSelectTo = SelectTo.select;
    selectedTo = value;
    emit(ChangeDropList());
  }

  void validationDropList() {
    if (selectFrom == null) {
      isSelectFrom = SelectFrom.none;
    }
    if (selectedTo == null) {
      isSelectTo = SelectTo.none;
    }
    if (selectService == null) {
      isSelectService = SelectService.none;
    }
    if (selectIncoterm == null) {
      isSelectIncoterm = SelectIncoterm.none;
    }

    if (dateShipper == null) {
      shipmentDate = ShipmentDate.none;
    }

    emit(ValidationDropListState());
  }

  //Select Service
  SelectService isSelectService = SelectService.firstTime;
  String? selectService;
  List<String> selectServiceList = [
    'Door To Door',
    'Door To Port',
    'Port To Port',
    'Port To Door'
  ];

  void onchangeServiceList(String value) {
    selectService = value;
    isSelectService = SelectService.select;
    emit(ChangeDropList());
  }

  //Select incoterm
  SelectIncoterm isSelectIncoterm = SelectIncoterm.firstTime;
  String? selectIncoterm;
  List<String> selectIncotermList = [
    'EXW - Ex Works',
    'FCA',
    'CPT',
    'CIP',
    'DPU',
    'DAP',
    'FAS',
    'FOB',
    'CFR',
    'CIF',
  ];

  void onchangeSelectIncotermList(String value) {
    selectIncoterm = value;
    isSelectIncoterm = SelectIncoterm.select;
    emit(ChangeDropList());
  }


  //Drop List Stackable/Tiltable
  String? selectStackable="Stackable";
  List<String> selectStackableList = [
    'Stackable',
    'Unstackable',
    'tiltable',
    'Untiltable',
  ];

  void onchangeStackableList(String value) {
    selectIncoterm = value;
    isSelectIncoterm = SelectIncoterm.select;
    emit(ChangeDropList());
  }



  //Date

  String? dateShipper;
  DateTime firstDate = DateTime.now();
  bool chooseReceiverDate = false;

  void changeShipperDate({required DateTime picked}) {
    dateShipper = DateFormat('yyyy-MM-dd ').format(picked);
    firstDate = picked;
    chooseReceiverDate = true;
    shipmentDate = ShipmentDate.select;

    emit(ChangeSelectDate());
  }
  //
  // String? dateReceiver;
  //
  // void changeReceiverDate({required DateTime picked}) {
  //   dateReceiver = DateFormat('yyyy-MM-dd ').format(picked);
  //   chooseReceiverDate = true;
  //   receiverDate = ReceiverDate.select;
  //
  //   emit(ChangeSelectDate());
  // }

  ShipmentDate shipmentDate = ShipmentDate.firstTime;
  ReceiverDate receiverDate = ReceiverDate.firstTime;

  //Table Item TextFormField

  List<TextEditingController> descriptionField = [TextEditingController()];
  List<TextEditingController> grossWeightField = [TextEditingController()];
  List<TextEditingController> volumeField = [TextEditingController()];
  List<TextEditingController> quantityField = [TextEditingController()];
  List<TextEditingController> dimensionField = [TextEditingController()];
  List<TextEditingController> hsCodeField = [TextEditingController()];
  List<TextEditingController> stackableField = [TextEditingController()];

  void removeItem() {
    descriptionField.removeLast();
    grossWeightField.removeLast();
    volumeField.removeLast();
    quantityField.removeLast();
    dimensionField.removeLast();
    hsCodeField.removeLast();
    stackableField.removeLast();
    emit(RemoveItemState());
  }

  void addItem() {
    descriptionField.add(TextEditingController());
    grossWeightField.add(TextEditingController());
    volumeField.add(TextEditingController());
    quantityField.add(TextEditingController());
    dimensionField.add(TextEditingController());
    hsCodeField.add(TextEditingController());
    stackableField.add(TextEditingController());
    emit(AddItemState());
  }

  //Submitted Table

  List<SubmittedOffersModels> submittedTableList = [
    SubmittedOffersModels(
        submittedOffers: "3500 QAR",
        serviceProviderRating: "4",
        serviceProviderName: "xxxxxxxxxx",
        serviceProviderContact: "Confirm to discover",
        serviceProviderNamePaid: "Mohamed Company"),
    SubmittedOffersModels(
        submittedOffers: "3500 QAR",
        serviceProviderRating: "4",
        serviceProviderName: "xxxxxxxxxx",
        serviceProviderContact: "Confirm to discover",
        serviceProviderNamePaid: "Mohamed Company"),
    SubmittedOffersModels(
        submittedOffers: "3500 QAR",
        serviceProviderRating: "4",
        serviceProviderName: "xxxxxxxxxx",
        serviceProviderContact: "Confirm to discover",
        serviceProviderNamePaid: "Mohamed Company"),
    SubmittedOffersModels(
        submittedOffers: "3500 QAR",
        serviceProviderRating: "4",
        serviceProviderName: "xxxxxxxxxx",
        serviceProviderContact: "Confirm to discover",
        serviceProviderNamePaid: "Mohamed Company"),
    SubmittedOffersModels(
        submittedOffers: "3500 QAR",
        serviceProviderRating: "4",
        serviceProviderName: "xxxxxxxxxx",
        serviceProviderContact: "Confirm to discover",
        serviceProviderNamePaid: "Mohamed Company"),
  ];

  //load more
  bool loadMoreTableSubmitted = false;
  bool showButtonLoadMoreTableSubmitted = false;

  void changeLoadMoreTableSubmittedStates() {
    loadMoreTableSubmitted = !loadMoreTableSubmitted;
    emit(ChangeLoadMoreStates());
  }

  void loadMoreTableSubmittedShow() {
    if (submittedTableList.length > 3) {
      showButtonLoadMoreTableSubmitted = true;
    }
    emit(ChangeShowButtonLoadMoreStates());
  }

  //Check Box Bool List

  List<bool>? checkBoxBool = [

  ];


  List<bool> isPayButton=[];
  bool isPayShowMore=false;

  bool isEdit=false;
  void changeIsEditState(){
    isEdit=true;
    emit(IsChangeEditButtonState());
  }

  void changeIsPayButton({
  required BuildContext context,
}){
    Navigator.of(context).pop();
    isPayButton=[];
    for (var element in checkBoxBool!) {
      isPayButton.add(element);
    }

    emit(ChangeIsPayButtonState());
  }

  void changeIsPayShowMore({
    required BuildContext context,
  }){
    Navigator.of(context).pop();

    isPayShowMore=true ;
    emit(ChangeIsPayButtonState());
  }

  void initializationListCheckBox({
    required int length,
  }) {
    checkBoxBool=[];
    for (int i = 0; i <= length; i++) {
      checkBoxBool!.add(false);
      isPayButton.add(false);
    }
    emit(InitializationListCheckBoxState());
  }

  void allListCheckBox({
    required int length,
    required bool value,
  }) {
    countTrue=[];
    if(value==true){
      isShowPayment=true;
      for (int i = 0; i < length; i++) {
        countTrue.add(value);

      }
    }else{
      isShowPayment=false;
      countTrue=[];
    }
    print(countTrue.length);
    for (int i = 0; i <= length; i++) {
      checkBoxBool![i] = value;

    }
    emit(AllListCheckBoxState());
  }


  //if all is true , make select all is true
  void allIsTrue({
    required int length,
  }) {
    List<bool> isTrue=[];
    for (var element in checkBoxBool!) {
      isTrue.add(element);
    }
    isTrue.removeLast();
      if (!isTrue.contains(false)) {
        checkBoxBool![length] = true;

      }else{
        checkBoxBool![length] = false;


      }
    emit(AllIsTrueState());
  }

  void changeCheckBoxValue({
    required bool value,
    required int index,
  }) {
    if(value==true){
      countTrue.add(true);
    }else{
      countTrue.removeLast();
    }
    print(countTrue.length);

    if(countTrue.length>=3){
      isShowPayment=true;
    }else{
      isShowPayment=false;
    }
    checkBoxBool![index] = value;
    emit(ChangeCheckBoxState());
  }


  //Payment Button

  bool isShowPayment=false;
  List<bool>countTrue=[];


  //Side Bar
  SelectItemSideBar selectItemSideBar = SelectItemSideBar.dashboard;

  void selectDashboard() {
    selectItemSideBar = SelectItemSideBar.dashboard;
    emit(ChangeSideBar());
  }

  void selectMasterList() {
    selectItemSideBar = SelectItemSideBar.masterList;
    emit(ChangeSideBar());
  }

  void selectHistory() {
    selectItemSideBar = SelectItemSideBar.history;
    emit(ChangeSideBar());
  }

  void selectProfile() {
    selectItemSideBar = SelectItemSideBar.profile;
    emit(ChangeSideBar());
  }


}
