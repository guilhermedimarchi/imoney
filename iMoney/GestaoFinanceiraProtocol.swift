//
//  GestaoFinanceiraProtocol.swift
//  iMoney
//
//  Created by Student on 7/20/16.
//  Copyright © 2016 Student. All rights reserved.
//

import Foundation
import UIKit
import CoreData

protocol GestaoFinanceiraProtocol {

    var nome: String { get set }
    var valor: Double { get set}
    var data: NSDate { get set }
    var moeda: MoedaTipo { get set }
    
}
