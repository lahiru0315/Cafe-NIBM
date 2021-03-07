//
//  Items.swift
//  Cafe-NIBM
//
//  Created by Lahiru on 3/7/21.
//  Copyright © 2021 Lahiru. All rights reserved.
//

import Foundation
class Items {
    var prodcutName : String
    var productDescription:  String
    var price : Float
    var discount : Int
    var id : Int
    var url:String
   
    
    init(Name : String,discription : String,price : Float,discount:Int,id:Int,photourl:String) {
        
        self.prodcutName = Name
        self.productDescription = discription
        self.price = price
        self.discount = discount
        self.id = id
        self.url=photourl
        
        
    }
}
