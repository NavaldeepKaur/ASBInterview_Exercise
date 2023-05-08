//
//  AppConstants.swift
//  ASBInterviewExercise
//
//  Created by Navaldeep Kaur on 03/05/23.
//

import UIKit

enum ApiMethods : String {
    case get = "GET"
    case post = "POST"
}

struct APIAddress {
    static let transanctionListApi = "https://gist.githubusercontent.com/Josh-Ng/500f2716604dc1e8e2a3c6d31ad01830/raw/4d73acaa7caa1167676445c922835554c5572e82/test-data.json"
}

struct AlertTitles {
    static let errorMessage : String = "No Data Found!"
    static let ok : String = "Ok"
    static let noInternetTitle : String = "No internet connection"
    static let internetMessage : String = "It look like you've lost your internet connection.Try again once your connection is back."
    static let transanctionDetailTitle = "Transanction Detail"
    static let youMoney = "YouMoney"
    static let credit = "Credit"
    static let debit = "Debit"
}

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

func GetInstance(of controller : Controller) -> UIViewController
{
    return controller.obj!
}
