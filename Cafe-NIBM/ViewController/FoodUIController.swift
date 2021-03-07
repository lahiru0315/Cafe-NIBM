//
//  FoodUIController.swift
//  Cafe-NIBM
//
//  Created by Lahiru on 3/6/21.
//  Copyright © 2021 Lahiru. All rights reserved.
//

import UIKit

class FoodUIController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    let elements = ["rice","kottu","pizza","burgers","rice","kottu","pizza","burgers","rice","kottu","pizza","burgers"]
    let foodDescription = ["10% discount","Free Coke","Free Garlic Bread","30% discount","10% discount","Free Coke","Free Garlic Bread","30% discount","10% discount","Free Coke","Free Garlic Bread","30% discount"]
    let prices = ["350.00", "450.00", "950.00", "280.00","350.00", "450.00", "950.00", "280.00","350.00", "450.00", "950.00", "280.00"]
    
    @IBOutlet weak var tableVew: UITableView!
    
    override func viewDidLoad() {
        
        tableVew.delegate = self
        tableVew.dataSource = self
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return elements.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomTableViewCell
        
        
        cell.foodNameLbl.text = elements[indexPath.row]
        cell.foodImage.image = UIImage(named: elements[indexPath.row])
        cell.foodDescriptionLbl.text = foodDescription[indexPath.row]
        cell.foodPriceLbl.text = ( "Rs." +  prices[indexPath.row])
        
        return cell
    }

}
