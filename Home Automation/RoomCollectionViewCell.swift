//
//  RoomCollectionViewCell.swift
//  Home Automation
//
//  Created by Nikhil Garg on 24/05/16.
//  Copyright © 2016 Thapar. All rights reserved.
//

import UIKit

class RoomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var instrumentLabel: UILabel!
    var data:Instrument?
    var state = false
    
    func loadData(){
        self.instrumentLabel.text=data?.appliance
        self.state=(data?.isON)!
        
        self.switchBack()
    }
    
    func switchBack() {
        if(state){
            instrumentLabel.textColor = UIColor.whiteColor()
            self.backgroundColor=UIColor.lightGrayColor()
        }else{
            instrumentLabel.textColor = UIColor.blackColor()
            self.backgroundColor=UIColor.whiteColor()
        }
    }
}
