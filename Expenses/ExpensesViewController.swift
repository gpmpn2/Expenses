//
//  ExpensesViewController.swift
//  Expenses
//
//  Created by Grant Maloney on 8/23/18.
//  Copyright © 2018 Grant Maloney. All rights reserved.
//

import UIKit

class ExpensesViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var expenses:[Expense] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        
        expenses = loadData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func loadData() -> [Expense] {
        var expenseData:[Expense] = []
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd, yyyy HH:mm"
        
        expenseData.append(Expense(title: "Dinner", amount:32.50, date:formatter.date(from: "June 1, 2018 18:30")!))
        expenseData.append(Expense(title: "Office Supplies", amount:59.34, date:formatter.date(from: "May 30, 2018 12:17")!))
        expenseData.append(Expense(title: "Uber", amount:16.23, date:formatter.date(from: "May 30, 2018 11:43")!))
        expenseData.append(Expense(title: "Coffee", amount:3.95, date:formatter.date(from: "May 29, 2018 8:45")!))
        
        return expenseData
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier") as! CustomTableViewCell
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd, yyyy HH:mm"
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale(identifier: "en_US")
        
        let title = expenses[indexPath.row].title
        let amount = numberFormatter.string(from: expenses[indexPath.row].amount as NSNumber)
        let date = formatter.string(from: expenses[indexPath.row].date)
        
        cell.titleLabel.text = title
        cell.amountLabel.text = amount
        cell.dateLabel.text = date
        
        return cell
    }
}
