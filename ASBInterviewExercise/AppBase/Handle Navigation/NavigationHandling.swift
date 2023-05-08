//
//  NavigationHandling.swift
//  ASBInterviewExercise
//
//  Created by Navaldeep Kaur on 08/05/23.
//

import UIKit

class Navigation
{
    enum Controller
    {
        case TransanctionDetailVC
        
        var obj: UIViewController?
        {
            switch self
            {
            case .TransanctionDetailVC :
            return StoryBoards.Main.obj?.instantiateViewController(withIdentifier: "TransanctionDetailVC")

            }}
    }

    enum StoryBoards
    {
        case Main
        
        var obj: UIStoryboard?
        {
            switch self
            {
            case .Main:
                return UIStoryboard(name: "Main", bundle: nil)
            }
        }
        
    }

   static func GetInstance(of controller : Controller) -> UIViewController
    {
        return controller.obj!
    }

}
