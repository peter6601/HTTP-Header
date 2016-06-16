//
//  ViewController.swift
//  headerHTTP
//
//  Created by 丁暐哲 on 2016/6/16.
//  Copyright © 2016年 Din. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    var someNumber =  Parameter()
    @IBOutlet weak var answerImage: UIImageView!
    @IBOutlet weak var FirstTextField: UITextField!
        {
        didSet{
            FirstTextField.delegate = self
            FirstTextField.keyboardType = UIKeyboardType.NumberPad
        }
    }
    @IBOutlet weak var secondTextField: UITextField!
        {
        didSet{
            secondTextField.delegate = self
            secondTextField.keyboardType = UIKeyboardType.NumberPad
        }
    }
    @IBAction func click(sender: UIButton) {
        if  FirstTextField.text!  != ""  {
            if secondTextField.text! != "" {
                someNumber.a = Int(FirstTextField.text!)!
                someNumber.b = Int(secondTextField.text!)!
            }
        }
        let aSingleAPI = FirstAPI()
        aSingleAPI.ConnectAPI(didLoadShot,firstNumber:someNumber.a ,secondNumber: someNumber.b )
    }
    
    func didLoadShot(data:Shots){
        answerImage.image = UIImage(data: NSData(contentsOfURL:NSURL(string: data.reslut)! )!)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
     
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    func dismissKeyboard(){
        view.endEditing(true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

