//
//  GestaoDespesa.swift
//  iMoney
//
//  Created by Student on 7/20/16.
//  Copyright © 2016 Student. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class GestaoDespesa: GestaoFinanceiraProtocol {

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

    var local: String {
        get { return self.local }
        set {}
    }
    
    var categoria: String {
        get { return self.categoria }
        set {}
    }
    
    var parcelaAtual: Int {
        get { return self.parcelaAtual }
        set {}
    }
    
    var parcelaTotal: Int {
        get { return self.parcelaTotal }
        set {}
    }
    
}