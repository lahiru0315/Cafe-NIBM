//
//  FoodUIController.swift
//  Cafe-NIBM
//
//  Created by Lahiru on 3/6/21.
//  Copyright © 2021 Lahiru. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseStorage


class FoodUIController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    

    
    @IBOutlet weak var tableVew: UITableView!
    var ref: DatabaseReference!
    
    var items: [Items] = []
//    var items : [Cafe-NIBM.Items] = []
    override func viewDidLoad() {
        
        tableVew.delegate = self
        tableVew.dataSource = self
        super.viewDidLoad()
       ref = Database.database().reference()
                let allPlaces = self.ref.child("products")
//
               allPlaces.observeSingleEvent(of: .value, with: { snapshot in
                    for child in snapshot.children {
                        let snap = child as! DataSnapshot
                        let placeDict = snap.value as! [String: Any]
                        let discount = placeDict["discount"] as! Int
                        let productDescription = placeDict["productDescription"] as! String
                        let prodcutName = placeDict["prodcutName"] as! String
                        let id = placeDict["id"] as! Int
                        let url = placeDict["url"] as! String
                        let price = placeDict["price"] as! Float
//
                        let foods = Items(Name:prodcutName,discription: productDescription,price: price,discount: discount,id: id,photourl: url)
//
                                           self.items.append(foods)
//
                    }
                    self.tableVew.reloadData()
//                   print(self.foods[0].id)
                })

        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return items.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomTableViewCell
        
        
//        cell.foodNameLbl.text = elements[indexPath.row]
//        cell.foodImage.image = UIImage(named: elements[indexPath.row])
//        cell.foodDescriptionLbl.text = foodDescription[indexPath.row]
//        cell.foodPriceLbl.text = ( "Rs." +  prices[indexPath.row])
        cell.foodNameLbl.text = self.items[indexPath.row].prodcutName
                  let storage = Storage.storage()
                  let storageRef = storage.reference()
                  
                  let path = "productImage/"+(self.items[indexPath.row].url)
                  
                 
                  let formattedString = path.replacingOccurrences(of: " ", with: "")
                  let islandRef = storageRef.child(formattedString)
                  
                  islandRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
                      if error != nil {
                     print("error")
                    } else {
                      // Data for "images/island.jpg" is returned
                      let image = UIImage(data: data!)
                      cell.foodImage.image = image
                      
                      
                    }
                  }
        //        cell.FoodItemImage.image = UIImage(named: foodItems[2])

                cell.foodDescriptionLbl.text = self.items[indexPath.row].productDescription
                cell.foodPriceLbl.text = ( "Rs." + String(self.items[indexPath.row].price))
        
        return cell
    }

}
