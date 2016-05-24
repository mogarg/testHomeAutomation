//
//  HomeViewController.swift
//  Home Automation
//
//  Created by Nikhil Garg on 24/05/16.
//  Copyright © 2016 Thapar. All rights reserved.
//

import UIKit

//Model Object
class Instrument: NSObject {
    var appliance:String? = nil
    var isON = false
    
    init(appliance:String,isON:Bool) {
        self.appliance = appliance
        self.isON = isON
    }
}

class HomeViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate {
    
    @IBOutlet weak var instrumentArray: UICollectionView!
    var selectedRoom = 0
    
    //Dictionary key=RoomName, Value = [I,I,I]
    
    var homeData = [
        "Drawing Room":[
            Instrument(appliance: "Fan", isON: true),
            Instrument(appliance: "Light", isON: true),
            Instrument(appliance: "Lamp", isON: true),
        ],
        "Kitchen":[
            Instrument(appliance: "Fan", isON: true),
            Instrument(appliance:  "Light", isON: true),
            Instrument(appliance: "Microwave", isON: true),
            Instrument(appliance: "Chimney", isON: true),
        ],
        "Living Room":[
            Instrument(appliance: "Fan", isON: true),
            Instrument(appliance: "Light", isON: true),
            Instrument(appliance: "AC", isON: true)
        ],
        "Room 1":[
            Instrument(appliance: "Fan", isON: true),
            Instrument(appliance: "Light", isON: false),
            Instrument(appliance: "Lamp", isON: true)
        ],
        "Room 2":[
            Instrument(appliance: "Fan", isON: true),
            Instrument(appliance: "Light", isON: true),
            Instrument(appliance: "Lamp", isON: true)
        ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")
        
        if indexPath.row == selectedRoom {
            cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
        }else{
            cell?.accessoryType = UITableViewCellAccessoryType.None
        }
        
        cell?.textLabel?.text = (homeData as NSDictionary).allKeys[indexPath.row] as? String
        return cell!
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let room = (homeData as NSDictionary).allKeys[selectedRoom] as! String
        return (homeData[room]?.count)!
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! RoomCollectionViewCell
        
        let room = (homeData as NSDictionary).allKeys[selectedRoom] as! String

        cell.data = homeData[room]![indexPath.item]
        cell.loadData()
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedRoom = indexPath.row
        tableView.reloadData()
        instrumentArray.reloadData()
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let room = (homeData as NSDictionary).allKeys[selectedRoom] as! String
        
        let data = homeData[room]![indexPath.item]
        
        data.isON = !data.isON
        
        homeData[room]![indexPath.item] = data
        
        instrumentArray.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
