//
//  TransanctionDetailVC.swift
//  ASBInterviewExercise
//
//  Created by Navaldeep Kaur on 03/05/23.
//

import UIKit

class TransanctionDetailVC: UIViewController {

    //MARK:- outlet and variables
    @IBOutlet weak var labelTotal: UILabel!
    @IBOutlet weak var labelGSTAmount: UILabel!
    @IBOutlet weak var labelSummary: UILabel!
    @IBOutlet weak var imageTo: UIImageView!
    @IBOutlet weak var imageFrom: UIImageView!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelAmount: UILabel!
    @IBOutlet weak var labelFrom: UILabel!
    @IBOutlet weak var labelTo: UILabel!
    var transanctionDetail : TransanctionModel?
    var transanctionAmount : Double?
    
    //MARK:- lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setView()
    }
    
    func setView(){
        self.navigationItem.title = AlertTitles.transanctionDetailTitle
        let image = UIImage(named: "blackBack")?.withRenderingMode(.alwaysOriginal)
        let backItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(backButton))
        self.navigationItem.leftBarButtonItem = backItem
        
        //set Transaction Detail data
        labelSummary.text = transanctionDetail?.summary
        labelDate.text = convertDateFormater(date:transanctionDetail?.transactionDate ?? "",formate: "E, d MMM yyyy,h:mm a")
        let amount = transanctionDetail?.credit ?? 0.0
        if amount.isNormal{
            labelAmount.text = "$\(transanctionDetail?.credit ?? 0)"
            labelFrom.text = transanctionDetail?.summary
            labelTo.text = AlertTitles.youMoney
            transanctionAmount = transanctionDetail?.credit ?? 0
            
        }else{
            labelAmount.text = "-$\(transanctionDetail?.debit ?? 0)"
            labelTo.text = transanctionDetail?.summary
            labelFrom.text = AlertTitles.youMoney
            transanctionAmount = transanctionDetail?.debit ?? 0
        }
        //show name Initial on image
        createImageWithNameInitial(name: String(labelFrom.text!.first!), imageView: imageFrom)
        createImageWithNameInitial(name: String(labelTo.text!.first!), imageView: imageTo)
       
        labelTotal.text = "\(String(describing: labelAmount.text ?? ""))"
        labelGSTAmount.text = "$\(getGSTAmount(includedGSTamount: transanctionAmount ?? 0.0))"
        
        
    }
    
    //MARK:- Other functions
    
    //calculate 15% GST
    func getGSTAmount(includedGSTamount:Double) -> Double{
        let gstAmount = (includedGSTamount/23) * 3
        return round(100 * gstAmount) / 100
    }
    
    @objc func backButton(sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: false)
    }
}
