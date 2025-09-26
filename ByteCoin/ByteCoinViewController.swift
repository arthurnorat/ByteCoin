//
//  ViewController.swift
//  ByteCoin
//
//  Created by Arthur Norat on 25/09/25.
//

import UIKit

class ByteCoinViewController: UIViewController {
	
	var byteCoinView: ByteCoinView?
	
	override func loadView() {
		byteCoinView = ByteCoinView()
		view = byteCoinView
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}


}

