import UIKit
import Charts



class ChartsViewController: UIViewController {
 
    @IBOutlet weak var selectedCellLabel: UILabel!
    
    
    @IBOutlet weak var pieChartView: PieChartView!
    var menuView: BTNavigationDropdownMenu!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //-----------------INICIA DROPDOWN---------------------------------
        
        carregaContas()
        carregaDadosGrafico()
        
        //let items = ["Conta principal", "Poupanca"]
        self.selectedCellLabel.text = items.first
        self.navigationController?.navigationBar.translucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.0/255.0, green:180/255.0, blue:220/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        menuView = BTNavigationDropdownMenu(navigationController: self.navigationController, title: items[1], items: items)
        menuView.cellHeight = 50
        menuView.cellBackgroundColor = self.navigationController?.navigationBar.barTintColor
        menuView.cellSelectionColor = UIColor(red: 0.0/255.0, green:160.0/255.0, blue:195.0/255.0, alpha: 1.0)
        menuView.keepSelectedCellColor = true
        menuView.cellTextLabelColor = UIColor.whiteColor()
        menuView.cellTextLabelFont = UIFont(name: "Avenir-Heavy", size: 17)
        menuView.cellTextLabelAlignment = .Left // .Center // .Right // .Left
        menuView.arrowPadding = 15
        menuView.animationDuration = 0.5
        menuView.maskBackgroundColor = UIColor.blackColor()
        menuView.maskBackgroundOpacity = 0.3
        menuView.didSelectItemAtIndexHandler = {(indexPath: Int) -> () in
            print("Did select item at index: \(indexPath)")
            self.selectedCellLabel.text = self.items[indexPath]
        }
        
        self.navigationItem.titleView = menuView

        
        //-----------------INICIA GRAFICO---------------------------------
        
        // Do any additional setup after loading the view.
       /*
        let months = ["Comida", "Festa", "Car"]
        let unitsSold = [20.0, 4.0, 6.0]
        
        setChart(months, values: unitsSold)*/
        
    }
    
    var items: [String] = []
    func carregaContas(){
        items = []
        let contas: [Conta] = ContaDAO.buscarTodos()
        for c in contas
        {
            items.append(c.nome!)
        }
    }
    
    func carregaDadosGrafico() {
        var list: [Despesa] = []
        var months: [String] = []
        var unitsSold: [Double] = []
        list = DespesaDAO.buscarTodos()
        
        
        for d in list
        {
            months.append(d.nome!)
            unitsSold.append(Double(d.valor!))
        }
        
        setChart(months, values: unitsSold)
    }
    override func viewWillAppear(animated: Bool) {
        
        preparingForAnimation()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        animationChangeSegmentControl()
        
    }

    
    func setChart(dataPoints: [String], values: [Double]) {
        
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let pieChartDataSet = PieChartDataSet(yVals: dataEntries, label: "")
        let pieChartData = PieChartData(xVals: dataPoints, dataSet: pieChartDataSet)
        pieChartView.data = pieChartData
        
        var colors: [UIColor] = []
        
        for i in 0..<dataPoints.count {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))
            
            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            colors.append(color)
        }
        
        pieChartDataSet.colors = colors
    }
    
    /* Responsible for let the elements with the zero opacity */
    func preparingForAnimation() {
        
        self.selectedCellLabel.alpha = 0
        self.pieChartView.alpha      = 0
        
    }
    
    /* Responsible for let the elements with the high visibility */
    func animationChangeSegmentControl() {
        
        UIView.animateWithDuration(0.5, delay: 0, options: .CurveEaseOut, animations: {
            
            self.selectedCellLabel.alpha = 1
            self.pieChartView.alpha      = 1
            
            }, completion: nil)
        
    }
    
}