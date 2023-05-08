//
//  UIViewController.swift
//  ASBInterviewExercise
//
//  Created by Navaldeep Kaur on 04/05/23.
//

import UIKit

//MARK: - UIViewController Extnesion
extension UIViewController {
    
     func showLoader() {
        LoaderView.shared.show()
    }
    
     func hideLoader() {
        LoaderView.shared.hide()
    }
    
    func showAlertMessage(titleStr:String, messageStr:String)
    {
        let alert = UIAlertController(title: titleStr, message: messageStr, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: AlertTitles.ok, style: UIAlertAction.Style.default) {
            UIAlertAction in
        }
        // Add the actions
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func convertDateFormater(date: String,formate:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?

        guard let date = dateFormatter.date(from: date) else {
            assert(false, "no date from string")
            return ""
        }

        dateFormatter.dateFormat = formate
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        let timeStamp = dateFormatter.string(from: date)

        return timeStamp
    }
    
    func generateRandomColor() -> UIColor {
               let redValue = CGFloat(drand48())
               let greenValue = CGFloat(drand48())
               let blueValue = CGFloat(drand48())
               
               let randomColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 0.8)
               
               return randomColor
           }
    
    func createImageWithNameInitial(name:String,imageView:UIImageView) {
        let lblFromInitialize = UILabel()
        lblFromInitialize.frame.size = CGSize(width: 36.0, height: 36.0)
        lblFromInitialize.textColor = UIColor.init(white: 1.0, alpha: 0.6)
        lblFromInitialize.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        lblFromInitialize.text = name
        lblFromInitialize.textAlignment = NSTextAlignment.center
        lblFromInitialize.backgroundColor = generateRandomColor()
        
        UIGraphicsBeginImageContext(lblFromInitialize.frame.size)
        lblFromInitialize.layer.render(in: UIGraphicsGetCurrentContext()!)
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
    }
}
