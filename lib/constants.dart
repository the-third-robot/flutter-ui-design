import 'package:flutter/material.dart';

var style1 =TextStyle(
  color: Colors.indigo.shade900,
  fontSize: 18, fontWeight:
  FontWeight.w800,
);
var style2 =TextStyle(
    color: Colors.black,
    fontSize: 18, fontWeight:
    FontWeight.w800,
);

var titleStyle =TextStyle(
  color: Colors.indigo.shade900,
  fontSize: 24, fontWeight:
  FontWeight.w800,
);

List<Map<String, Object> > cardData = [
  {
    "icon": Icon(Icons.arrow_downward),
    "transaction_type": "Sent",
    "description": "Sending Payments to client",
    "amount" : 150,
  },
  {
    "icon": Icon(Icons.arrow_upward),
    "transaction_type": "Receive",
    "description": "Receiving Salary from Company and I am glad that this is happening",
    "amount" : 250,
  },
  {
    "icon": Icon(Icons.payment),
    "transaction_type": "Loan",
    "description": "Loan for the Car",
    "amount" : 400,
  },
  {
    "icon": Icon(Icons.arrow_downward),
    "transaction_type": "Sent",
    "description": "Sending Payments to client",
    "amount" : 150,
  },
  {
    "icon": Icon(Icons.drafts),
    "transaction_type": "Payment",
    "description": "Payment from Andrea",
    "amount" : 30.00,
  },
  {
    "icon": Icon(Icons.payment),
    "transaction_type": "Loan",
    "description": "Loan for the Car",
    "amount" : 400,
  },
  {
    "icon": Icon(Icons.arrow_downward),
    "transaction_type": "Sent",
    "description": "Sending Payments to client",
    "amount" : 150,
  },
  {
    "icon": Icon(Icons.arrow_upward),
    "transaction_type": "Receive",
    "description": "Receiving Salary from Company and I am glad that this is happening",
    "amount" : 250,
  },
  {
    "icon": Icon(Icons.payment),
    "transaction_type": "Loan",
    "description": "Loan for the Car",
    "amount" : 400,
  },
];

cardBuilder(
    var icon,
    var transactionType,
    var description,
    var amount,
    BuildContext context,
    ){
  return GestureDetector(
    onTap: (){

    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),                child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.13,
              height: MediaQuery.of(context).size.height * 0.06,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(15),
              ),
              child: icon,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Text(
                      transactionType,
                      overflow: TextOverflow.ellipsis,
                      style: style2),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Text(
                      description,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Text('\$ $amount',style: style2)
          ],
        ),
        ),
      ),
    ),
  );
}