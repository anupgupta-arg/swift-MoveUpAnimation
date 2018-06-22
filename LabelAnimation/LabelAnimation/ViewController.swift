//
//  ViewController.swift
//  LabelAnimation
//
//  Created by Anup Gupta on 21/06/18.
//  Copyright © 2018 GeekGuns. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var label3: UILabel!
    
    @IBOutlet weak var label4: UILabel!
    
    
    var labelArray : NSArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label1.alpha = 0
        label2.alpha = 0
        label3.alpha = 0
        label4.alpha = 0
        labelArray = [label1,label2,label3,label4]
/*
  // Animation Using Diffrent Method
        
  //  **********************************************
        // Method 1 :
        // CallBack Using Closer
        // AnimationStart()
        
      
  //  **********************************************
        // Method 2 :
        // Recurtion Method Best Way
        
        labelArray = [label1,label2,label3,label4]
        StartAnimation6(label: labelArray[0] as! UILabel, index: 0)
        
       
  //  **********************************************
        // Method 3 :
        // Normal Approch
        //StartAnimation1(label: label1)
    
    */
 
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
//  **********************************************
// Animation Using CallBack
    
    func AnimationStart() {
        
        StartAnimation5(label: label1) { (Success)   in
            
            self.StartAnimation5(label: self.label2) { (Success)   in
                
                self.StartAnimation5(label: self.label3) { (Success)   in
                   
                    self.StartAnimation5(label: self.label4) { (Success)   in
                        
                        
                        
                    }
                    
                    
                }
                
            }
            
        }
    }
    
    
    
//  **********************************************
// Start Animation Using Normal Using Multiple Function
    

    func StartAnimation1(label : UILabel) {
        
        UIView.animate(withDuration: 0.6, animations: {
            
            label.alpha = 1
            label.transform = CGAffineTransform(translationX: 0, y: -100)

        }, completion: { done in
            
            self.StartAnimation2(label: self.label2)
        })
    }
    func StartAnimation2(label : UILabel) {
        
        UIView.animate(withDuration: 0.6, animations: {
            
             label.alpha = 1
            label.transform = CGAffineTransform(translationX: 0, y: -100)
           
        }, completion: { done in
           
            self.StartAnimation3(label: self.label3)
        })
    }
    func StartAnimation3(label : UILabel) {
        
        
        UIView.animate(withDuration: 0.6, animations: {
            label.alpha = 1
            label.transform = CGAffineTransform(translationX: 0, y: -100)
          
        }, completion: { done in
            
            self.StartAnimation4(label: self.label4)
        })
    }
    func StartAnimation4(label : UILabel) {
         label.isHidden = false
        UIView.animate(withDuration: 0.6, animations: {
             label.alpha = 1
            label.transform = CGAffineTransform(translationX: 0, y: -100)
            
        }, completion: { done in
           
            
        })
    }
    
    func StartAnimation5(label : UILabel, animationDone : @escaping (_ success : String) -> Void) {
        label.isHidden = false
        UIView.animate(withDuration: 0.6, animations: {
            label.alpha = 1
            label.transform = CGAffineTransform(translationX: 0, y: -100)
            
        }, completion: { done in
            
            animationDone("Success")
        })
    }


//  **********************************************
    // Animation Using Recurion
    
    
    func StartAnimation6(label : UILabel, index : Int) {
        label.isHidden = false
        UIView.animate(withDuration: 0.6, animations: {
            label.alpha = 1
            label.transform = CGAffineTransform(translationX: 0, y: -100)
            
        }, completion: { done in
            if index < self.labelArray.count {
            self.StartAnimation6(label: self.labelArray[index] as! UILabel, index: index + 1)
            }
            
        })
        
       
    }
  
//  **********************************************
   
    // reverse Animation
    
    func reverseAnimation(label : UILabel, index : Int) {
       
        UIView.animate(withDuration: 0.6, animations: {
            label.alpha = 0
            label.transform = CGAffineTransform(translationX: 0, y: 0)
            
        }, completion: { done in
            if index < self.labelArray.count {
                self.reverseAnimation(label: self.labelArray[index] as! UILabel, index: index + 1)
            }
            
        })
        
        
    }
    
    
    
    
    
    
    @IBAction func animationButtonAction(_ sender: Any) {
        
        // Animation Using Diffrent Method
        
        //  **********************************************
        // Method 1 :
        // CallBack Using Closer
//         AnimationStart()
        
        
        //  **********************************************
        // Method 2 :
        // Recurtion Method Best Way
        
//          labelArray = [label1,label2,label3,label4]
          StartAnimation6(label: labelArray[0] as! UILabel, index: 0)
        
        
        //  **********************************************
        // Method 3 :
        // Normal Approch
//        StartAnimation1(label: label1)

    }
    
    
    
    @IBAction func reSetButtonAction(_ sender: Any) {
        
// Reverse Animation
        
//        Method 1 :
        
        
//        label1.alpha = 0
//        label2.alpha = 0
//        label3.alpha = 0
//        label4.alpha = 0
//
//
//        self.label1.transform = .identity
//        self.label2.transform = .identity
//        self.label3.transform = .identity
//        self.label4.transform = .identity
        
        
        // Method 2 :
        
        
         reverseAnimation(label: labelArray[0] as! UILabel, index: 0)
    }
    
}

