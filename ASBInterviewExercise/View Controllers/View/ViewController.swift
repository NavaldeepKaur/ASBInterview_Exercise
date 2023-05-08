//
//  ViewController.swift
//  ASBInterviewExercise
//
//  Created by ASB on 29/07/21.
//

import UIKit

class ViewController: UIViewController {

    //MARK:- outlet and variables
    @IBOutlet weak var transanctionTableView: UITableView!
    var viewModel : TransanctionViewModel?
    var transanctionList = transanction()
    var page = 1
    var isScroll = false
    var isFetching = false
    
    //MARK:- lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //call transactionList Api
        transanctionHistoryApiCall()
    }
    //MARK:- Other functions
    func setView(){
        
        viewModel = TransanctionViewModel.init(Delegate: self, view: self)
        transanctionTableView.delegate = self
        transanctionTableView.dataSource = self
        transanctionTableView.separatorStyle = .none
       
    }
    
    func transanctionHistoryApiCall(){
        viewModel?.transanctionHistoryApi(completion: { [weak self] response in
            guard let self = self else {

                return

              }
            //sort list according to date 
            let dateArray = response.sorted{
                guard let d1 = $0.transactionDate, let d2 = $1.transactionDate else { return false }
                return d1 > d2
            }
            self.transanctionList = dateArray
            self.isFetching = true
            DispatchQueue.main.async {
                self.transanctionTableView.setEmptyMessage("")
                self.transanctionTableView.reloadData()
            }
        })
    }
}

//MARK:- delegate
extension ViewController : TransanctionDelegate{
    func didError(error: String) {
        self.isFetching = false
        self.transanctionTableView.setEmptyMessage(error)
        self.transanctionTableView.reloadData()
    }
}

//MARK:- TableViewDelegateAndDataSource
extension ViewController : UITableViewDelegate, UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return transanctionList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransanctionTableCell")as! TransanctionTableCell
        cell.setData(transactionData:transanctionList[indexPath.row], view: self)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: false)
        
        let transanctionDetailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "TransanctionDetailVC") as! TransanctionDetailVC
        transanctionDetailVC.transanctionDetail = transanctionList[indexPath.row]
        self.navigationController?.pushViewController(transanctionDetailVC, animated: false)
    }
}


extension ViewController : UIScrollViewDelegate{
    
    //Pagination
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        if scrollView == transanctionTableView{
            if ((transanctionTableView.contentOffset.y + transanctionTableView.frame.size.height) >= transanctionTableView.contentSize.height)
            {
                if isFetching == true
                {
                    isScroll = true
                    isFetching = false
                    self.page = self.page+1
                    
                    self.transanctionHistoryApiCall()
                }
                else{
                    isScroll = false
                }
            }
        }
    }
}
