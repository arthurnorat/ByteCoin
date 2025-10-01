//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Arthur Norat on 29/09/25.
//

import Foundation

protocol CoinManagerDelegate {
	func didUpdatePrice(price: String, currency: String)
	func didFailWithError(error: Error)
}

struct CoinManager {
	
	var delegate: CoinManagerDelegate?
	
	let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
	let apiKey = "2633FB3E-0C83-4B68-B88D-3805E25B9588"
	
	let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
	
	func getCoinPrice(for currency: String) {
		let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)" // Step 1: Create URL object
		
		if let url = URL(string: urlString) {
			let session = URLSession(configuration: .default) // Step 2: Create a URLSession
			let task = session.dataTask(with: url) { (data, response, error) in // 3. Create task
				if error != nil {
					self.delegate?.didFailWithError(error: error!)
					return
				}
				
				if let safeData = data {
					if let bitcoinPrice = self.parseJSON(safeData) {
						let priceString = String(format: "%.2f", bitcoinPrice)
						self.delegate?.didUpdatePrice(price: priceString, currency: currency)
					}
				}
			}
			task.resume() // Step 4: Start the task
		}
	}
	
	func parseJSON(_ coinData: Data) -> Double? {
		let decoder = JSONDecoder()
		do {
			let decodedData = try decoder.decode(CoinData.self, from: coinData)
			let lastPrice = decodedData.rate
			return lastPrice
		} catch {
			self.delegate?.didFailWithError(error: error)
			return nil
		}
	}
}
