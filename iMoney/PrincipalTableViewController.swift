//
//  PrincipalTableViewController.swift
//  iMoney
//
//  Created by Student on 7/18/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit


class PrincipalTableViewController: UITableViewController {
    
    
    
    var list: [GestaoFinanceiraProtocol] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        list = GestaoFinanceiraDAO.buscarTodos()
        
            
        navigationItem.title = "Conta 1"

        ContaDAO.deletarAll()
        var c: Conta = Conta()
        c.nome = "Conta corrente"
        
        
        
        
        ContaDAO.inserir(c)
        
        var c1: Conta = Conta()
        c1.nome = "Poupanca"
        
        ContaDAO.inserir(c1)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.list = GestaoFinanceiraDAO.buscarTodos()
        self.tableView.reloadData()
    }


    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return list.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("principalIdentifier", forIndexPath: indexPath) as! PrincipalTableViewCell
        
        //let section = indexPath.section
        //let row = indexPath.row
        
        
        let principal = list[indexPath.row]
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "EEEE, MMMM dd, yyyy HH:mm"
        
        
        
        if principal is GestaoDespesa {
            cell.nome.text = principal.despesa!.nome!
            cell.valor.text = "R$ " + String(principal.despesa!.valor!)
            cell.valor.textColor = UIColor.redColor()
            let convertedDate = dateFormatter.stringFromDate(principal.despesa!.data!)
            cell.data.text = String(convertedDate)
        }
        else {
            cell.nome.text = principal.receita!.nome!
            cell.valor.text = "R$ " + String(principal.receita!.valor!)
            cell.valor.textColor = UIColor.greenColor()
            let convertedDate = dateFormatter.stringFromDate(principal.receita!.data!)
            cell.data.text = String(convertedDate)

        }
        
        
        return cell
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let destination = segue.destinationViewController as! DetalheViewController
        
        //destination.detailImage.image = ERROR!
        
        let row = tableView.indexPathForSelectedRow?.row
        
        destination.gestao = list[row!]
        
    }
    

    
}
