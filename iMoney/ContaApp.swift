//
//  ContaApp.swift
//  iMoney
//
//  Created by Student on 7/20/16.
//  Copyright © 2016 Student. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ContaApp: ContaProtocol {

    var gestao: GestaoFinanceiraProtocol {
        get { return self.gestao }
        set {}
    }

}