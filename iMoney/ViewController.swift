//
//  ViewController.swift
//  iMoney
//
//  Created by Student on 7/18/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var fieldParcelaAtual: UITextField!
    @IBOutlet weak var fieldParcelaTotal: UITextField!
    @IBOutlet weak var fieldDescricao: UITextField!
    @IBOutlet weak var fieldValor: UITextField!
    @IBOutlet weak var opcao: UISegmentedControl!
    
    @IBOutlet weak var labelParcela: UILabel!
    @IBOutlet weak var labelDe: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        if (self.opcao.titleForSegmentAtIndex(opcao.selectedSegmentIndex) == "Receita") {
            labelParcela.hidden      = true
            labelDe.hidden           = true
            fieldParcelaAtual.hidden = true
            fieldParcelaTotal.hidden = true
        }
        else {
            labelParcela.hidden      = false
            labelDe.hidden           = false
            fieldParcelaAtual.hidden = false
            fieldParcelaTotal.hidden = false
        }
        
    }
    
    
    @IBAction func salvarGestao(sender: AnyObject) {
        
        if (self.opcao.titleForSegmentAtIndex(opcao.selectedSegmentIndex) == "Despesa") {
            let despesa: Despesa = Despesa()
            despesa.nome         = self.fieldDescricao.text
            despesa.valor        = Double(self.fieldValor.text!)
            despesa.parcelaAtual = Int(self.fieldParcelaAtual.text!)
            despesa.parcelaTotal = Int(self.fieldParcelaTotal.text!)
            DespesaDAO.inserir(despesa)
        }
        else {
            let receita: Receita = Receita()
            receita.nome = self.fieldDescricao.text
            receita.valor = Double(self.fieldValor.text!)
            ReceitaDAO.inserir(receita)
        }
        
    }
    
    // Esconde algumas views da tela
    @IBAction func tappedShowOpcao(sender: AnyObject) {
        
        if (self.opcao.titleForSegmentAtIndex(opcao.selectedSegmentIndex) == "Receita") {
            labelParcela.hidden      = true
            labelDe.hidden           = true
            fieldParcelaAtual.hidden = true
            fieldParcelaTotal.hidden = true
        }
        else {
            labelParcela.hidden      = false
            labelDe.hidden           = false
            fieldParcelaAtual.hidden = false
            fieldParcelaTotal.hidden = false
        }
        
        
    }


}

