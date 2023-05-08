//
//  TransanctionModel.swift
//  ASBInterviewExercise
//
//  Created by Navaldeep Kaur on 03/05/23.
//

import Foundation

// MARK: - TransanctionModel
struct TransanctionModel: Decodable {
    let id: Int?
    let transactionDate, summary: String?
    let debit, credit: Double?
}

typealias transanction = [TransanctionModel]
