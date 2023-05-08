//
//  TransanctionViewModel.swift
//  ASBInterviewExercise
//
//  Created by Navaldeep Kaur on 03/05/23.
//

import UIKit


protocol TransanctionDelegate
{
    func didError(error:String)
}

class TransanctionViewModel
{
    typealias successHandler = (transanction) -> Void
    var delegate : TransanctionDelegate
    var view : UIViewController
    
    init(Delegate : TransanctionDelegate, view : UIViewController)
    {
        delegate = Delegate
        self.view = view
    }
   

    //MARK: - TransanctionHistoryApi
    func transanctionHistoryApi(completion: @escaping successHandler)
    {
        guard let url = URL(string: APIAddress.transanctionListApi) else {
                   return
               }
               var request = URLRequest(url: url)
               request.httpMethod = ApiMethods.get.rawValue
        self.view.showLoader()
      _ = RestClient.Shared.apiRequest(request, target: self.view) { data, response, error in
        
        guard data != nil else {
                self.delegate.didError(error: AlertTitles.errorMessage)
                return
                       }
                       let decoder = JSONDecoder()
                   if let decodedData = try? decoder.decode(transanction.self, from: data!){
                   
                    completion(decodedData)
                    self.view.hideLoader()
                }else{
                    self.view.hideLoader()
                    self.delegate.didError(error: AlertTitles.errorMessage)
                }
                      
                   }
       
    }
    
   
}
