import 'package:money_management/db/model/t.dart';


List<transaction> geter(){
  transaction tea = transaction();
  tea.name = 'Tea';
  tea.fee = '₹ 20';
  tea.time = '20 minutes Ago';
  tea.image = 'assets/icons/icons8-atm-card-96.png';
  tea.type = false;
  transaction netflix = transaction();
  netflix.name = 'NetFlix';
  netflix.fee = '₹ 180';
  netflix.time = '3 days Ago';
  netflix.image = 'assets/icons/icons8-atm-card-96.png';
  netflix.type = false;
  transaction starbucks = transaction();
  starbucks.name = 'Starbucks';
  starbucks.fee = '₹ 300';
  starbucks.time = '15 days Ago';
  starbucks.image = 'assets/icons/icons8-atm-card-96.png';
  starbucks.type = false;
  transaction salary = transaction();
  salary.name = 'Salary';
  salary.fee = '₹ 3000';
  salary.time = '20 days Ago';
  salary.image = 'assets/icons/icons8-atm-card-96.png';
  salary.type = true;
  return[tea,netflix,starbucks,salary,tea,netflix,starbucks,salary];
}


