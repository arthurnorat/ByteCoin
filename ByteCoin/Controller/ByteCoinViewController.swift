//
//  ViewController.swift
//  ByteCoin
//
//  Created by Arthur Norat on 25/09/25.
//

import UIKit

class ByteCoinViewController: UIViewController {
	
	var byteCoinView: ByteCoinView?
	var coinManager = CoinManager()
	
	override func loadView() {
		byteCoinView = ByteCoinView()
		view = byteCoinView
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		coinManager.delegate = self
		byteCoinView?.currencyPicker.delegate = self
		byteCoinView?.currencyPicker.dataSource = self
	}
}

extension ByteCoinViewController: UIPickerViewDataSource, UIPickerViewDelegate {
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}
	
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return coinManager.currencyArray.count
	}
	
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return coinManager.currencyArray[row]
	}
	
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		let selectedCurrency = coinManager.currencyArray[row]
		coinManager.getCoinPrice(for: selectedCurrency)
	}
}

extension ByteCoinViewController: CoinManagerDelegate {
	func didUpdatePrice(price: String, currency: String) {
		DispatchQueue.main.async {
			self.byteCoinView?.bitcoinLabel.text = price
			self.byteCoinView?.currencyLabel.text = currency
		}
	}
	
	func didFailWithError(error: any Error) {
		print("Erro: \(error)")
	}
}
