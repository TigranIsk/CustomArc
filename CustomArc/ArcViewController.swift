//
//  ViewController.swift
//  CaloriesMeasureInterface
//
//  Created by Tigran on 15.10.2017.
//  Copyright © 2017 Tigran. All rights reserved.
//

import UIKit
import CoreData

class ArcViewController: UIViewController {
    
    
    //MARK: - Outlets
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var arcView: ArcView!
    
    @IBOutlet weak var arcTopConstraint: NSLayoutConstraint!
    

    
    //MARK: - Properties
    var managedContext: NSManagedObjectContext!
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        arcView.counter = 0
        textField.text = "0"
    
        //Handling the arc's constraints
        let screenBounds = UIScreen.main.nativeBounds
        let screenHeight = screenBounds.height
        if screenHeight == 960 {
            arcTopConstraint.constant = 50
        }
        
    }
   
    
    
    //MARK: - Outlets Actions
   
    @IBAction func tapToDismissTheKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func textChangedByTapping(_ sender: UITextField){
        
        textField.text = "\(String(describing: sender.text!))"
        arcView.counter = Int(sender.text!)!
        slider.value = Float(sender.text!)!

    }
    
    @IBAction func sliderAction(_ sender: UISlider) {

        arcView.counter = Int(sender.value)
        textField.text = "\(Int(sender.value))"
    }
}

