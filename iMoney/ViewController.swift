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
    @IBOutlet weak var fieldData: UIDatePicker!
    
    @IBOutlet weak var opcao: UISegmentedControl!
    
    @IBOutlet weak var labelParcela: UILabel!
    @IBOutlet weak var labelDe: UILabel!
    @IBOutlet weak var labelDescricao: UILabel!
    @IBOutlet weak var labelValor: UILabel!
    @IBOutlet weak var labelCategoria: UILabel!
    
    @IBOutlet weak var viewCategorias: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        preparingForAnimation()
        
        if (self.opcao.titleForSegmentAtIndex(opcao.selectedSegmentIndex) == "Receita") {
            self.labelParcela.hidden      = true
            self.labelDe.hidden           = true
            self.fieldParcelaAtual.hidden = true
            self.fieldParcelaTotal.hidden = true
        }
        else {
            self.labelParcela.hidden      = false
            self.labelDe.hidden           = false
            self.fieldParcelaAtual.hidden = false
            self.fieldParcelaTotal.hidden = false
        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        animationChangeSegmentControl()
        
    }
    
    /* Responsible for let the elements with the zero opacity */
    func preparingForAnimation() {
    
        self.fieldParcelaTotal.alpha = 0
        self.fieldParcelaAtual.alpha = 0
        self.fieldDescricao.alpha    = 0
        self.fieldValor.alpha        = 0
        self.fieldData.alpha         = 0
        self.labelDe.alpha           = 0
        self.labelParcela.alpha      = 0
        self.labelDescricao.alpha    = 0
        self.labelValor.alpha        = 0
        self.labelCategoria.alpha    = 0
        //self.viewCategorias.alpha    = 0
    
    }
    
    /* Responsible for let the elements with the high visibility */
    func animationChangeSegmentControl() {
    
        UIView.animateWithDuration(0.5, delay: 0, options: .CurveEaseOut, animations: {
            
            self.fieldParcelaTotal.alpha = 1
            self.fieldParcelaAtual.alpha = 1
            self.fieldDescricao.alpha    = 1
            self.fieldValor.alpha        = 1
            self.fieldData.alpha         = 1
            self.labelDe.alpha           = 1
            self.labelParcela.alpha      = 1
            self.labelDescricao.alpha    = 1
            self.labelValor.alpha        = 1
            self.labelCategoria.alpha    = 1
            //self.viewCategorias.alpha    = 1
            
            }, completion: nil)
    
    }
    
    @IBAction func salvarGestao(sender: AnyObject) {
        
        if (self.opcao.titleForSegmentAtIndex(opcao.selectedSegmentIndex) == "Despesa") {
            
            let despesa: Despesa = Despesa()
            
            despesa.nome         = self.fieldDescricao.text
            despesa.valor        = Double(self.fieldValor.text!)
            despesa.parcelaAtual = Int(self.fieldParcelaAtual.text!)
            despesa.parcelaTotal = Int(self.fieldParcelaTotal.text!)
            despesa.data = self.fieldData.date
        
            DespesaDAO.inserir(despesa)
        }
        else {
            
            let receita: Receita = Receita()
            
            receita.nome = self.fieldDescricao.text
            receita.valor = Double(self.fieldValor.text!)
            receita.data = self.fieldData.date
            
            ReceitaDAO.inserir(receita)
        }
        
    }
    
    // Esconde algumas views da tela
    @IBAction func tappedShowOpcao(sender: AnyObject) {
        
        preparingForAnimation()
        animationChangeSegmentControl()
        
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

