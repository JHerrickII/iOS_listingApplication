//
//  ViewController.swift
//  UVA BucketList 3
//
//  Created by John Herrick on 2/11/17.
//  Copyright © 2017 John Herrick. All rights reserved.
//

import UIKit
import Foundation

var list = [BucketItem]()
var currentDealerIndex = -1


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var myTableView: UITableView!
    var itemtxt = ""
    var lattxt = ""
    var longtxt = ""
    var desctxt = ""
    var datetxt = NSDate()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        list.append(BucketItem(text: "Streak the Lawn.", latitude: "100", longitude: "100", describe: "Find glory in streaking the glorious UVA lawn", dateComp: NSDate()))
        list.append(BucketItem(text: "Hi Five Dean Groves.", latitude: "100", longitude: "100", describe: "Meet the man himself.", dateComp: NSDate()))
        list.append(BucketItem(text: "Kiss Professor Sherriff.", latitude: "100", longitude: "100", describe: "Show some love to the almighty Sherriff.", dateComp: NSDate()))
       
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return (list.count)
    }
    
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
      
        let done = UITableViewRowAction(style: .normal, title: "Done") { action, index in
            print("done button tapped")
            let item = list[indexPath.row]
            if(item.completed){
                item.completed = false;
            }
            else{
                item.completed = true;
                
            }
            self.sortItAll()
            tableView.reloadData();
        }
        done.backgroundColor = .red
        
        let edit = UITableViewRowAction(style: .normal, title: "Edit") { action, index in
            print("edit button tapped")
            let item = list[indexPath.row]
            self.itemtxt = item.text
            self.lattxt = item.latitude
            self.longtxt = item.longitude
            self.desctxt = item.describe
            self.datetxt = item.dateComp
            currentDealerIndex = indexPath.row
            self.performSegue(withIdentifier: "edit", sender: self);
           
        }
        edit.backgroundColor = .blue
        
        return [done, edit]
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as UITableViewCell
        let item = list[indexPath.row]
        let date = item.dateComp
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        let dateString = dateFormatter.string(from: date as Date)
        
        cell.textLabel?.text = item.text + " | " + dateString
        
        
        
        if(item.completed == true) {
            cell.backgroundColor = UIColor.orange;
        }
        else{
            cell.backgroundColor = UIColor.clear;
        }
        
        return(cell)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "edit") {
            let destViewController : EditItemViewController = segue.destination as! EditItemViewController
            destViewController.textText = self.itemtxt
            destViewController.latitudeText = self.lattxt
            destViewController.longitudeText = self.longtxt
            destViewController.descriptionText = self.desctxt
            destViewController.dateComp1 = self.datetxt
        
        }

    }
    
    override func viewDidAppear(_ animated: Bool) {
        //list = list.sorted(by: { $0.dateComp.compare($1.dateComp as Date) == ComparisonResult.orderedAscending })
        sortItAll()
        myTableView.reloadData()
    }
    
    func sortItAll(){
        list.sort(){item1, item2 in
            if(item1.completed && !item2.completed){
                return false
            }
            else if(item2.completed && !item1.completed){
                return true
            }
            else{
                if(item1.dateComp.timeIntervalSince1970 > item2.dateComp.timeIntervalSince1970){
                    return false
                }
                return true
            }
        }
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}

