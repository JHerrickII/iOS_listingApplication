//
//  AddItemViewController.swift
//  UVA BucketList 3
//
//  Created by John Herrick on 2/11/17.
//  Copyright © 2017 John Herrick. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {

    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var latitude: UITextField!
    @IBOutlet weak var longitude: UITextField!
    @IBOutlet weak var describe: UITextField!
    @IBOutlet weak var dateComp: UIDatePicker!
    var convertedString = ""
    
    @IBAction func datePickerAction(sender: AnyObject) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        let strDate = dateFormatter.string(from: dateComp.date)
        convertedString = strDate
        
    }

    
    @IBAction func addBucketItem(_ sender: Any) {
        if (input.text != "")
        {
            let target = BucketItem(text: input.text!, latitude: latitude.text!, longitude: longitude.text!, describe: describe.text!, dateComp: dateComp.date as NSDate)
            list.append(target)
            input.text = ""
            latitude.text = ""
            longitude.text = ""
            describe.text = ""
            
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            navigationController!.popViewController(animated: true)
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(EditItemViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
        //self.myTextField.delegate = self;
    }

    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    
   

    

}
