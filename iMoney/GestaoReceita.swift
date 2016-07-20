//
//  GestaoReceita.swift
//  iMoney
//
//  Created by Student on 7/20/16.
//  Copyright © 2016 Student. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class GestaoReceita: GestaoFinanceiraProtocol {
    
    var nome: String {
        get { return self.nome }
        set {
            
        }
    }
    
    var valor: Double {
        get { return self.valor}
        set {}
    }
    
    var data: NSDate {
        get { return self.data }
        set {}
    }
    var moeda: MoedaTipo {
        get { return self.moeda }
        set {}
    }
    
}
