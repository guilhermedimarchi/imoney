//
//  GestaoFinanceiraDAO.swift
//  iMoney
//
//  Created by Student on 7/20/16.
//  Copyright © 2016 Student. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class GestaoFinanceiraDAO {

    static func buscarTodos() -> [GestaoFinanceiraProtocol] {
        
        let listaDespesas = DespesaDAO.buscarTodos()
        let listaReceitas = ReceitaDAO.buscarTodos()
        
        var listaGestao: [GestaoFinanceiraProtocol] = []
        
        for item in listaDespesas {
            let aux: GestaoDespesa = GestaoDespesa()
            aux.despesa = item
            listaGestao.append(aux)
        }
        
        for item in listaReceitas {
            let aux: GestaoReceita = GestaoReceita()
            aux.receita = item
            listaGestao.append(aux)
        }
        
        return listaGestao
    }



}
