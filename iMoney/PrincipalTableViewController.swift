//
//  PrincipalTableViewController.swift
//  iMoney
//
//  Created by Student on 7/18/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit


/*
struct Receita2 {
    
    var nome: String!
    var valor: Double!
    var data: String!
    
    init (nome: String, valor: Double, data: String) {
        self.nome = nome
        self.valor = valor
        self.data = data
    }
}

*/
class PrincipalTableViewController: UITableViewController {
    
    
    var list: [Receita] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        list = ReceitaDAO.buscarTodos()
        
            
        navigationItem.title = "Conta 1"
/*
        let a = Receita(nome: "Mercado", valor: 25.2, data: "25/01/2016")
        let b = Receita(nome: "Livro", valor: 145.2, data: "25/01/2016")
        let c = Receita(nome: "Aviao", valor: 8, data: "25/01/2016")
        let d = Receita(nome: "gas", valor: 999, data: "25/01/2016")
        
        list.append(a)
        list.append(b)
        list.append(c)
        list.append(d)
  */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        
        cell.nome.text = principal.nome
        cell.valor.text = "R$ " + String(principal.valor)
        cell.data.text = String(principal.data)
        
        
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
