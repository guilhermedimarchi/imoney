//
//  ContaDAO.swift
//  iMoney
//
//  Created by Student on 7/18/16.
//  Copyright © 2016 Student. All rights reserved.
//

import Foundation
import UIKit
import CoreData


class ContaDAO {

    // utilizaremos o "static" nestes métodos para poder chamá-los diretamente, sem necessidade de instantciar a classe ContaDAO
    
    static func inserir(conta: Conta) {
        
        // em 2 passos, estamos buscando o objeto managedObjectContext
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        // preparando o banco para inserir um novo objeto
        context.insertObject(conta)
        
        do {
            // confirmando a inclusão do novo objeto no banco
            // para o CoreData, qualquer alteração que seja feita no banco pode ser confirmada com o método save()
            try context.save()
            print("Conta \(conta.nome) foi SALVA o/")
            
        } catch let erro as NSError {
            print(erro)
        }
    }
    
    static func alterar() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        do {
            // estamos trabalhando com contexto, então, ao alterar um objeto que foi buscado anteriormente no banco, não precisamos especificar o objeto para salvar
            try context.save()
            print("Conta foi ALTERADO o/")
            
        } catch let erro as NSError {
            print(erro)
        }
    }
    
    static func deletar(conta: Conta) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        // informar que a operação é um "delete"
        context.deleteObject(conta)
        
        do {
            try context.save()
            print("Conta \(conta.nome) foi DELETADA o/")
            
        } catch let erro as NSError {
            print(erro)
        }
    }
    
    
    static func buscarTodos() -> [Conta] {
        // obtendo AppDelegate onde esta a Core Data stack
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        // obtendo o context, que utilizaremos sempre que realizarmos operações com banco
        let context = appDelegate.managedObjectContext
        
        // lista de despesas que será retornada pelo método
        var contas: [Conta] = []
        
        // cria a busca que faremos no banco, informando nome da tabela
        let request: NSFetchRequest = NSFetchRequest(entityName: "Conta")
        // informa por quais campos o resultado será ordenado, e se será em ordem crescente ou decrescente
        request.sortDescriptors = [NSSortDescriptor(key: "nome", ascending: true)]
        
        // para definir critério de busca (cláusula "where"), utilize NSPredicate
        
        do {
            // obtendo usuarios do banco e preenchendo o array de Conta
            contas = try context.executeFetchRequest(request) as! [Conta]
            print("Total de contas: ", contas.count)
            
        } catch let erro as NSError {
            print(erro)
        }
        
        return contas
    }

}
