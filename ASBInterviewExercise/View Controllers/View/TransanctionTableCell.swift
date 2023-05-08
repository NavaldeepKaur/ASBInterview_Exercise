//
//  TransanctionTableCell.swift
//  ASBInterviewExercise
//
//  Created by Navaldeep Kaur on 03/05/23.
//

import UIKit

class TransanctionTableCell: UITableViewCell {

    //MARK:- Outlet and Variables
    @IBOutlet weak var labelSummary: UILabel!
    @IBOutlet weak var labelStatus: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelAmount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK:- SetData in cell
    func setData(transactionData: TransanctionModel,view:UIViewController){
        labelSummary.text = transactionData.summary ?? ""
        labelDate.text = view.convertDateFormater(date:transactionData.transactionDate ?? "",formate: "dd MMM yyyy")
        //check is user getting credit amount or debit
        let amount = transactionData.credit ?? 0.0
        if amount.isNormal{
            labelAmount.text = "\(transactionData.credit ?? 0)"
            labelStatus.text = AlertTitles.credit
            labelStatus.textColor = .green
        }else{
            labelAmount.text = "\(transactionData.debit ?? 0)"
            labelStatus.text = AlertTitles.debit
            labelStatus.textColor = .red

        }
    }
}

