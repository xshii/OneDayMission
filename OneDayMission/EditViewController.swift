//
//  EditViewController.swift
//  OneDayMission
//
//  Created by gakki on 21/02/2018.
//  Copyright © 2018 gakki. All rights reserved.
//

import UIKit

class EditViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    

    
    @IBOutlet weak var timeBar: UISlider!
    @IBOutlet weak var intervalLabel: UILabel!
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    @IBOutlet weak var categoryPicker: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //timeBar.value
        startTimeLabel.text = "0 min"
        endTimeLabel.text = "180 min"
        timeBar.minimumValue = 0
        timeBar.maximumValue = 180.0
        timeBar.value = 30
        
        timeBar.thumbTintColor = UIColor(red: CGFloat(timeBar.value/timeBar.maximumValue), green: 0, blue: 0, alpha: 1.0)
        intervalLabel.text =  String(Int(timeBar.value)) + " min"
        categoryPicker.delegate = self
    }

    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Actions
    
    @IBAction func changeTimeAction(_ sender: UISlider) {
        
        var currentValue = Int(timeBar.value)
        currentValue = currentValue - currentValue % 5
        intervalLabel.text =  String(currentValue) + " min"
        timeBar.value = Float(currentValue)
        timeBar.thumbTintColor = UIColor(red: CGFloat(1.0 - timeBar.value/timeBar.maximumValue), green: 0, blue: 0, alpha: 1.0)
        
    }
    
    //MARK: UIPickerDataSource
    let defaultPickerArray = [
        Category.study.rawValue,
        Category.work.rawValue,
        Category.eat.rawValue,
        Category.leisure.rawValue,
        Category.others.rawValue
    ]
    var userCustomPickerArray = [String]()
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return defaultPickerArray.count + userCustomPickerArray.count
        
    }
    //MARK: UIPickerDelegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return defaultPickerArray[row]
    }
    
}

