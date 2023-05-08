//
//  CommonFunctions.swift
//  ASBInterviewExercise
//
//  Created by Navaldeep Kaur on 04/05/23.
//

import Network
import UIKit
import Alamofire

class AllUtilies
{
    //MARK: - Validation functions    
    static var isAnimating = false
    
    static var isConnectedToInternet:Bool
    {
        return NetworkReachabilityManager()!.isReachable
    }
    
    
}

extension String {
    static let shortDateUS: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateStyle = .short
        return formatter
    }()
    var shortDateUS: Date? {
        return String.shortDateUS.date(from: self)
    }
}
