//
//  DetalheViewController.swift
//  iMoney
//
//  Created by Eduardo Encarnacao on 7/22/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class DetalheViewController: UIViewController {
    
    
    
    @IBOutlet weak var labelDescricaoGestao: UILabel!
    @IBOutlet weak var labelData: UILabel!
    @IBOutlet weak var labelValor: UILabel!
    @IBOutlet weak var labelParcela: UILabel!
    @IBOutlet weak var labelParcelaAtual: UILabel!
    @IBOutlet weak var labelDe: UILabel!
    @IBOutlet weak var labelParcelaFinal: UILabel!
    @IBOutlet weak var labelCategoria: UILabel!
    @IBOutlet weak var imagemCategoria: UIImageView!
    
    
    var gestao: GestaoFinanceiraProtocol?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "EEEE, MMMM dd, yyyy HH:mm"
        
        if gestao is GestaoDespesa {
            
            self.labelDescricaoGestao.text  = self.gestao!.despesa?.nome
            self.labelValor.text            = "R$ " + String(self.gestao!.despesa?.valor)
            self.labelValor.textColor       = UIColor.redColor()
            
            let convertedDate   = dateFormatter.stringFromDate((self.gestao!.despesa?.data!)!)
            self.labelData.text = String(convertedDate)
            
            self.labelParcelaAtual.text = String(self.gestao!.despesa?.parcelaAtual)
            self.labelParcelaFinal.text = String(self.gestao!.despesa?.parcelaTotal)
            
            self.imagemCategoria.image = UIImage(named: (gestao!.despesa?.categoria)!)
        
        }
        else {
        
            self.labelDescricaoGestao.text  = self.gestao!.receita?.nome
            self.labelValor.text            = "R$ " + String(self.gestao!.receita?.valor)
            self.labelValor.textColor       = UIColor.greenColor()
            
            let convertedDate   = dateFormatter.stringFromDate((self.gestao!.receita?.data!)!)
            self.labelData.text = String(convertedDate)
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(animated: Bool) {
        
        preparingForAnimation()
        
        if self.gestao is GestaoDespesa {
            self.labelParcela.hidden      = false
            self.labelDe.hidden           = false
            self.labelParcelaAtual.hidden = false
            self.labelParcelaFinal.hidden = false
            self.labelCategoria.hidden    = false
            self.imagemCategoria.hidden   = false
        }
        else {
            self.labelParcela.hidden      = true
            self.labelDe.hidden           = true
            self.labelParcelaAtual.hidden = true
            self.labelParcelaFinal.hidden = true
            self.labelCategoria.hidden    = true
            self.imagemCategoria.hidden   = true
        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        animationChangeSegmentControl()
        
    }
    
    /* Responsible for let the elements with the zero opacity */
    func preparingForAnimation() {
        
        self.labelDescricaoGestao.alpha = 0
        self.labelData.alpha            = 0
        self.labelValor.alpha           = 0
        self.labelParcela.alpha         = 0
        self.labelParcelaAtual.alpha    = 0
        self.labelDe.alpha              = 0
        self.labelParcelaFinal.alpha    = 0
        self.labelCategoria.alpha       = 0
        self.imagemCategoria.alpha      = 0
        
    }
    
    
    /* Responsible for let the elements with the high visibility */
    func animationChangeSegmentControl() {
        
        UIView.animateWithDuration(0.5, delay: 0, options: .CurveEaseOut, animations: {
           
            self.labelDescricaoGestao.alpha = 1
            self.labelData.alpha            = 1
            self.labelValor.alpha           = 1
            self.labelParcela.alpha         = 1
            self.labelParcelaAtual.alpha    = 1
            self.labelDe.alpha              = 1
            self.labelParcelaFinal.alpha    = 1
            self.labelCategoria.alpha       = 1
            self.imagemCategoria.alpha      = 1
            
            }, completion: nil)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
