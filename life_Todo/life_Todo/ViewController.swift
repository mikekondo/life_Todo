//
//  ViewController.swift
//  life_Todo
//
//  Created by admin on 2021/05/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Today_Out: UIButton!
    @IBOutlet weak var Tomorrow_Out: UIButton!
    @IBOutlet weak var Week_Out: UIButton!
    @IBOutlet weak var Month_Out: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Today_Out.layer.cornerRadius=30
        self.Tomorrow_Out.layer.cornerRadius=30
        self.Month_Out.layer.cornerRadius=30
        self.Week_Out.layer.cornerRadius=30
        // Do any additional setup after loading the view.
    }


}

