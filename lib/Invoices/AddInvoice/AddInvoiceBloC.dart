import 'package:rxdart/rxdart.dart';

class AddInvoiceBloc{

 // static double initialSubTotal = 0.0; //if the data is not passed by param it initializes with 0
//  int initialTax = 0; //if the data is not passed by param it initializes with 0
//  int initialTotal = 0;//if the data is not passed by param it initializes with 0
  bool isTotalVisible = false;
  bool isSave = true;
//  BehaviorSubject<double> subTotalCounter;
//  BehaviorSubject<int> taxCounter;
//  BehaviorSubject<int> totalCounter;
  BehaviorSubject<bool> isTotalVisibleChecker;
  BehaviorSubject<bool> isSaveChecker;

  AddInvoiceBloc({this.isTotalVisible, this.isSave}){

    //subTotalCounter = new BehaviorSubject<double>.seeded(AddInvoiceBloc.initialSubTotal); //initializes the subject with element already
//    taxCounter = new BehaviorSubject<int>.seeded(this.initialTax); //initializes the subject with element already
//    totalCounter = new BehaviorSubject<int>.seeded(this.initialTotal); //initializes the subject with element already
    isTotalVisibleChecker = new BehaviorSubject<bool>.seeded(this.isTotalVisible);
    isSaveChecker = new BehaviorSubject<bool>.seeded(this.isSave);
  }

//  Observable<double> get subTotalObservable => subTotalCounter.stream;
//  Observable<int> get taxObservable => taxCounter.stream;
//  Observable<int> get totalObservable => totalCounter.stream;
  Observable<bool> get isTotalVisibleObservable => isTotalVisibleChecker.stream;
  Observable<bool> get isSaveObservable => isSaveChecker.stream;

//  void calculateLineTotal(){
//    lineTotal = initialSubTotal+lineTotal;
//    subTotalCounter.sink.add(initialSubTotal);
//  }

//  void calculateSubTotal(double lineTotal){
//    initialSubTotal = initialSubTotal+lineTotal;
//    print(initialSubTotal);
//    subTotalCounter.sink.add(initialSubTotal);
//  }



 void changeVisibilityOne(){

      isTotalVisibleChecker.sink.add(true);
      isSaveChecker.sink.add(false);
  }

 void changeVisibilityTwo(){
   isTotalVisibleChecker.sink.add(false);
   isSaveChecker.sink.add(true);
  }

//
//  void decrement(){
//    initialCount--;
//    _subjectCounter.sink.add(initialCount);
//  }

  void dispose(){
//    subTotalCounter.close();
//    taxCounter.close();
//    totalCounter.close();
    isTotalVisibleChecker.close();
    isSaveChecker.close();
  }

}


final addInvoiceBloc = AddInvoiceBloc();
