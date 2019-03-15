//
//  InfoScheduleViewController.swift
//  teste04
//
//  Created by Paulo Matheus on 08/10/2018.
//  Copyright © 2018 Paulo Matheus. All rights reserved.
//

import UIKit

class InfoScheduleViewController: UIViewController {

	var indexDayOne: DayOne!
	var indexDayTwo: DayTwo!
	var indexSegmented: ScheduleViewController!
	
    @IBOutlet weak var ivImagePerson: UIImageView!
    @IBOutlet weak var lbType: UILabel!
	@IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbStartTime: UILabel!
    @IBOutlet weak var lbFinishTime: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
		print("primeiro dia \(indexDayOne.completeName)")
		print("segundo dia \(indexDayTwo.completeName)")
        type()
        name()
        time()
		print("--------->>>> \(String(describing: indexSegmented))")
    	//print("indice  \()")
        // Do any additional setup after loading the view.
    }
    
    func type (){
        lbType.text = ("Tipo: \(indexDayOne.type)")
    }
    func name(){
        lbName.text = ("Nome: \(indexDayOne.completeName)")
    }
    func time(){
        lbStartTime.text = ("Início: \(indexDayOne.startTime)")
        lbFinishTime.text = ("Término: \(indexDayOne.finishedTime)")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
	
	
	
}
