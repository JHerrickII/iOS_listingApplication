//
//  EditItemViewController.swift
//  UVA BucketList 3
//
//  Created by John Herrick on 2/17/17.
//  Copyright © 2017 John Herrick. All rights reserved.
//

import UIKit

class EditItemViewController: UIViewController {

    @IBOutlet weak var text: UITextField!
    @IBOutlet weak var latitude: UITextField!
    @IBOutlet weak var longitude: UITextField!
    @IBOutlet weak var description1: UITextField!
    @IBOutlet weak var dateComp: UIDatePicker!
    
    var textText = String()
    var latitudeText = String()
    var longitudeText = String()
    var descriptionText = String()
    var dateComp1 = NSDate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        text.text = textText
        latitude.text = latitudeText
        longitude.text = longitudeText
        description1.text = descriptionText
        dateComp.date = dateComp1 as Date
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(EditItemViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
        //self.myTextField.delegate = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func saveEdit(_ sender: Any) {
        if (text.text != "")
        {
            let target = BucketItem(text: text.text!, latitude: latitude.text!, longitude: longitude.text!, describe: description1.text!, dateComp: dateComp.date as NSDate)
            list[currentDealerIndex] = target
            
            text.text = ""
            latitude.text = ""
            longitude.text = ""
            description1.text = ""
            
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            navigationController!.popViewController(animated: true)
        }

    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    

}
