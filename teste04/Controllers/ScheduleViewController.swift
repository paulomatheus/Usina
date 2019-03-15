//
//  ScheduleViewController.swift
//  teste04
//
//  Created by Paulo Matheus on 05/09/2018.
//  Copyright © 2018 Paulo Matheus. All rights reserved.
//

import UIKit

class ScheduleViewController:   UITableViewController {

    
    @IBOutlet weak var scDays: UISegmentedControl!
    @IBOutlet var tvSchedule: UITableView!
	var jDayOne: [DayOne] = []
	var jDayTwo: [DayTwo] = []
    
    
    /*let dayOne: [String] = ["Credenciamento / Welcome Coffee", "Conhecendo o campus", "Solenidade de abertura"]
    let dayOneSub: [String] = ["Credenciamento | 08h00", "Tour | 09h00", "Palestra | 10h00" ]
    let dayTwo: [String] = ["Credenciamento / Welcome Coffee", "Gestão de pessoas, uma chave para o sucesso", "Uma integração voltada ao trabalho em equipe"]
    let dayTwoSub: [String] = ["Credenciamento | 08h00", "Paelstra | 09h00", "Palestra | 10h00" ] */
	var myIndex = 0
	var indexDaySelected = 0
	
	func loadDayOne(){
		let fileURLOne = Bundle.main.url(forResource: "firstDay.json", withExtension: nil)! //Quando coloco nil ele encontra o primeiro arquivo com o nome dito
		let fileURLTwo = Bundle.main.url(forResource: "secondDay.json", withExtension: nil)!
		let jsonDataOne = try! Data(contentsOf: fileURLOne)
		let jsonDataTwo = try! Data(contentsOf: fileURLTwo)
		do{
			jDayOne = try JSONDecoder().decode([DayOne].self, from: jsonDataOne)
			jDayTwo = try JSONDecoder().decode([DayTwo].self, from: jsonDataTwo)
		} catch {
			print(error.localizedDescription)
		}
	}
    
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var returnValue = 0
        switch (scDays.selectedSegmentIndex) {
        case 0:
            //returnValue = dayOne.count
			returnValue = jDayOne.count
			indexDaySelected = 0
            break
        case 1:
            returnValue = jDayTwo.count
			indexDaySelected = 1
            break
		default:
            break
        }
        return returnValue
    }
	internal override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let scheduleCell = tableView.dequeueReusableCell(withIdentifier: "scheduleCell", for: indexPath as IndexPath)
        let firstDay = jDayOne[indexPath.row] //numero de linhas eh de acordo com o json
		let secondDay = jDayTwo[indexPath.row]
		
        scheduleCell.textLabel?.textColor = UIColor.white
        switch (scDays.selectedSegmentIndex) {
        case 0:
            scheduleCell.textLabel!.text = firstDay.name //Título
			//scheduleCell.textLabel!.text = dayOne[indexPath.row] //Título
            scheduleCell.detailTextLabel!.text = "\(firstDay.type) | \(firstDay.startTime) "
			//scheduleCell.detailTextLabel!.text = dayOneSub[indexPath.row] //SubTitulo
            break
        case 1:
            scheduleCell.textLabel!.text = secondDay.name
            scheduleCell.detailTextLabel!.text = "\(secondDay.type) | \(secondDay.startTime) "
            break
        default:
            break
        }
        
        return scheduleCell
    }
	
        override func viewDidLoad() {
            super.viewDidLoad()
            let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
            rightSwipe.direction = .right
            //direcao padrao é a direita
            let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
            leftSwipe.direction = .left
            
            view.addGestureRecognizer(rightSwipe)
            view.addGestureRecognizer(leftSwipe)
			
			loadDayOne()
            
            
        }
	
	//MÉTODO PARA PASSAR INFORMAÇÃO DE UMA TELA PARA OUTRA
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		let vc = segue.destination as! InfoScheduleViewController
		//let sc = UISegmentedControl.Segment.RawValue.self as! InfoScheduleViewController
		//var sc2 = scDays.selectedSegmentIndex as! InfoScheduleViewController
		//var title = scDays.titleForSegment(at: scDays.selectedSegmentIndex) as! InfoScheduleViewController
		//var index = 0 as! InfoScheduleViewController
		let indexDayOne = jDayOne[tableView.indexPathForSelectedRow!.row]
		let indexDayTwo = jDayTwo[tableView.indexPathForSelectedRow!.row]
		vc.indexDayOne = indexDayOne
		vc.indexDayTwo = indexDayTwo
		//sc2.indexSegmented = title
		//index = indexDaySelected
		
		//title.indexSegmented = title
	}
	
	
        
        @objc func handleSwipe(sender: UISwipeGestureRecognizer){
            func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                var returnValue = 0
                switch (scDays.selectedSegmentIndex) {
                case 0:
					//returnValue = dayOne.count
					returnValue = jDayOne.count
                    break
                case 1:
                    returnValue = jDayTwo.count
                    break
                default:
                    break
                }
                return returnValue
            }
            /*var returnValue = 0
            if sender.state == .ended {
                switch sender.direction {
                case .right:
                    returnValue = jDayTwo.count
                case .left:
					//returnValue = dayOne.count
					returnValue = jDayOne.count
                    
                default:
					//returnValue = dayOne.count
					//returnValue = jDayOne.count
                    print("ola")
                }
            }*/
        }
        
        
	override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
    
    
    @IBAction func scChange(_ sender: UISegmentedControl) {
        tvSchedule.reloadData()// vai voltar para as funções de tableView
    }
    
  /*  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "scheduleCell", sender: self)
    
    } */
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
