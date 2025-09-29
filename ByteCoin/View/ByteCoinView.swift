//
//  ByteCoinView.swift
//  ByteCoin
//
//  Created by Arthur Norat on 26/09/25.
//

import UIKit

class ByteCoinView: UIView {
	
	lazy var byteCoinStackView: UIStackView = {
		let stackView = UIStackView(arrangedSubviews: [byteCoinLabel, coinView])
		stackView.axis = .vertical
		stackView.spacing = 20
		stackView.alignment = .center
		stackView.translatesAutoresizingMaskIntoConstraints = false
		return stackView
	}()
	
	let byteCoinLabel: UILabel = {
		let label = UILabel()
		label.text = "ByteCoin"
		label.textColor = UIColor(red: 48/255, green: 53/255, blue: 73/255, alpha: 1.0)
		label.font = .systemFont(ofSize: 50, weight: .thin)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	lazy var coinView: UIView = {
		let view = UIView()
		view.backgroundColor = UIColor(red: 161/255, green: 236/255, blue: 239/255, alpha: 1.0)
		view.layer.cornerRadius = 30
		view.clipsToBounds = true
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	lazy var rateStackView: UIStackView = {
		let stackView = UIStackView(arrangedSubviews: [bitcoinImageView, bitcoinLabel, currencyLabel])
		stackView.axis = .horizontal
		stackView.spacing = 2
		stackView.alignment = .center
		stackView.distribution = .equalCentering
		stackView.translatesAutoresizingMaskIntoConstraints = false
		return stackView
	}()
	
	lazy var bitcoinImageView: UIImageView = {
		let imageView = UIImageView(image: UIImage(systemName: "bitcoinsign.circle.fill"))
		imageView.tintColor = .white
		imageView.contentMode = .scaleToFill
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()
	
	lazy var bitcoinLabel: UILabel = {
		let label = UILabel()
		label.text = "..."
		label.font = .systemFont(ofSize: 30, weight: .medium)
		label.textAlignment = .center
		label.textColor = .white
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	lazy var currencyLabel: UILabel = {
		let label = UILabel()
		label.text = "BRL"
		label.font = .systemFont(ofSize: 30, weight: .medium)
		label.textColor = .white
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	lazy var currencyPicker: UIPickerView = {
		let pickerView = UIPickerView()
		pickerView.translatesAutoresizingMaskIntoConstraints = false
		return pickerView
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = UIColor(red: 129/255, green: 236/255, blue: 236/255, alpha: 1.0)
		addElements()
		configConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func addElements() {
		addSubview(byteCoinStackView)
		coinView.addSubview(rateStackView)
		addSubview(currencyPicker)
	}
	
	func configConstraints() {
		NSLayoutConstraint.activate([
			byteCoinStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
			byteCoinStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
			byteCoinStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),

			coinView.bottomAnchor.constraint(equalTo: byteCoinStackView.bottomAnchor, constant: 0),
			
			rateStackView.topAnchor.constraint(equalTo: coinView.topAnchor),
			rateStackView.bottomAnchor.constraint(equalTo: coinView.bottomAnchor),
			rateStackView.leadingAnchor.constraint(equalTo: coinView.leadingAnchor, constant: 20),
			rateStackView.trailingAnchor.constraint(equalTo: coinView.trailingAnchor, constant: -20),
			
			bitcoinImageView.heightAnchor.constraint(equalToConstant: 80),
			bitcoinImageView.widthAnchor.constraint(equalToConstant: 80),
			
			currencyPicker.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
			currencyPicker.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
			currencyPicker.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0),
			currencyPicker.heightAnchor.constraint(equalToConstant: 216)
		])
	}
}
