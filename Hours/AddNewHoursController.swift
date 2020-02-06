//
//  AddNewHoursController.swift
//  Hours
//
//  Created by Zackary O'Connor on 2/5/20.
//  Copyright © 2020 Zackary O'Connor. All rights reserved.
//

import UIKit

class AddNewHoursController: UIViewController {
    
    let pickerHeight: CGFloat = 125
    let date = Date()

    let messageLabel = UILabel(text: "Select a date and a time.", textColor: .label, fontSize: 32, fontWeight: .semibold, textAlignment: .left, numberOfLines: 2)
    let startTimeLabel = UILabel(text: "Start Time", textColor: .label, fontSize: 18, fontWeight: .semibold, textAlignment: .left, numberOfLines: 1)
    let endTimeLabel = UILabel(text: "End Time", textColor: .label, fontSize: 18, fontWeight: .semibold, textAlignment: .left, numberOfLines: 1)
    
    lazy var startTimePickerView: UIDatePicker = {
        let picker = UIDatePicker()
        picker.constrainHeight(constant: pickerHeight)
        picker.datePickerMode = .dateAndTime
        return picker
    }()

    lazy var endTimePickerView: UIDatePicker = {
        let picker = UIDatePicker()
        picker.constrainHeight(constant: pickerHeight)
        picker.datePickerMode = .dateAndTime
        return picker
    }()

    let doneButton = UIButton(title: "Done", backgroundColor: .systemGreen, setTitleColor: .label, font: .systemFont(ofSize: 18, weight: .regular), cornerRadius: 8)
    let cancelButton = UIButton(title: "Cancel", backgroundColor: .clear, setTitleColor: .label, font: .systemFont(ofSize: 18, weight: .regular), cornerRadius: 0)

    
    fileprivate var formattedDateWorked: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
    
    
    fileprivate var formattedStartDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter.string(from: startTimePickerView.date)
    }


    fileprivate var formattedEndDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter.string(from: endTimePickerView.date)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        setupView()
        doneButton.addTarget(self, action: #selector(handleDoneButtonPressed), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(handleCancelButtonTapped), for: .touchUpInside)
        doneButton.constrainHeight(constant: 54)
    }

    fileprivate func setupView() {
        
        view.addSubview(messageLabel)
        messageLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 36, left: 16, bottom: 0, right: 16))


        let stack = UIStackView(arrangedSubviews: [
            UIStackView(arrangedSubviews: [startTimeLabel, startTimePickerView], axis: .vertical),
            UIStackView(arrangedSubviews: [endTimeLabel, endTimePickerView], axis: .vertical)
            ], customSpacing: 36, axis: .vertical)
        view.addSubview(stack)
        stack.centerInSuperview()


        let buttonsStack = UIStackView(arrangedSubviews: [
            doneButton,
            cancelButton
            ], customSpacing: 8, axis: .vertical)
        view.addSubview(buttonsStack)
        buttonsStack.anchor(top: nil, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 0, left: 16, bottom: 24, right: 16))
    }


    
    
    @objc fileprivate func handleDoneButtonPressed() {
        dismiss(animated: true)
    }
    

    @objc fileprivate func handleCancelButtonTapped() {
        dismiss(animated: true)
    }
}
