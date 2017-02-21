//
//  ViewController.swift
//  PickinFruit
//
//  Created by Flatiron School on 7/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController,  UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var spinButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var fruitPicker: UIPickerView!
    
    var fruitsArray = ["🍎", "🍊", "🍌", "🍐", "🍇", "🍉", "🍓", "🍒", "🍍"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fruitPicker.delegate = self
        fruitPicker.dataSource = self
        
        self.spinButton.accessibilityLabel = Constants.SPIN_BUTTON
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 27
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var fruits = row
        fruits %= 9
        return fruitsArray[fruits]
        
    }
    
    
    
    
    @IBAction func spinButtonTapped(_ sender: UIButton) {
        for i in 0...2 {
            let randomRow = Int(arc4random_uniform(UInt32(fruitsArray.count + 9)))
            
            
            fruitPicker.selectRow(randomRow, inComponent: i, animated: true)
        }
        
        if fruitPicker.selectedRow(inComponent: 0) == fruitPicker.selectedRow(inComponent: 1) && fruitPicker.selectedRow(inComponent: 1) == fruitPicker.selectedRow(inComponent: 2) {
            
            self.resultLabel.text = "WINNER!"
            self.resultLabel.alpha = 1.0
            UIView.animate(withDuration: 0.5, delay: 0.0, options:[ .autoreverse, .repeat ], animations: {
                UIView.setAnimationRepeatCount(8)
                self.resultLabel.alpha = 0 }, completion: nil)
            
    
        } else {
            
            self.resultLabel.text = "TRY AGAIN!"
            self.resultLabel.alpha = 1.0
            UIView.animate(withDuration: 0.5, delay: 0.0, options:[ .autoreverse, .repeat ], animations: {
                UIView.setAnimationRepeatCount(8)
                self.resultLabel.alpha = 0 }, completion: nil)
            
            
        }
        
    }
}
    // MARK: Set Up
    extension ViewController {
        
        override func viewDidLayoutSubviews() {
            if self.spinButton.layer.cornerRadius == 0.0 {
                configureButton()
            }
        }
        
        func configureButton()
        {
            self.spinButton.layer.cornerRadius = 0.5 * self.spinButton.bounds.size.width
            self.spinButton.layer.borderColor = UIColor.white.cgColor
            self.spinButton.layer.borderWidth = 4.0
            self.spinButton.clipsToBounds = true
        }
        
        
        
}


