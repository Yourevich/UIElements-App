//
//  CollectionController.swift
//  LessonThree
//
//  Created by Илья Зорин on 05.09.2023.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let data = [
        Section(
            
            type: .UIControl,
            rows: [
                (.Button, ButtonController()),
                (.Slider, SliderController()),
                (.Switch, SwitchController()),
                (.UISegmentedControl, SegmentedControlController()),
                (.UITextField, TextFieldController()),
                (.UIDatePicker, DatePickerController()),
                (.UIStepper, StepperController())
            ]
            
        ),
        Section(
            type: .UIScrollView,
            rows: [
                (.UITextView, TextViewController())
            ]
        ),
        Section(
            type: .UIView,
            rows: [
                (.UILabel, LabelController()),
                (.UIImageView, ImageController()),
                (.UIActivityIndicatorView, ActivitiIndicatorController()),
                (.UIStackView, StackViewController())
            ]
            
        )
    ]
    
    
    
    let imageDictionary: [TypeOfUi: UIImage] = [
        .UILabel: UIImage(systemName: "note.text")!,
        .UIImageView: UIImage(systemName: "photo")!,
        .UIActivityIndicatorView: UIImage(systemName: "goforward")!,
        .UITextView: UIImage(systemName: "text.viewfinder")!,
        .Slider: UIImage(systemName: "slider.vertical.3")!,
        .UISegmentedControl: UIImage(systemName: "chart.bar")!,
        .Button: UIImage(systemName: "button.programmable")!,
        .Switch: UIImage(systemName: "switch.2")!,
        .UITextField: UIImage(systemName: "character.cursor.ibeam")!,
        .UIDatePicker: UIImage(systemName: "calendar")!,
        .UIStepper: UIImage(systemName: "plus.square.fill.on.square.fill")!,
        .UIStackView: UIImage(systemName: "square.stack.3d.down.forward.fill")!
        
    ]
    

    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.reuseIdentifier)
        collectionView.register(SectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SectionHeaderView")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.allowsSelection = true
        collectionView.backgroundColor = UIColor.systemBackground
        navigationItem.title = "Collection"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupCollectionView()
        definesPresentationContext = true
    }
    
    func setupCollectionView() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
  
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data[section].rows.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.reuseIdentifier, for: indexPath) as? CustomCollectionViewCell else {
            fatalError("Failed to dequeue CustomCollectionViewCell")
        }
        
        cell.isUserInteractionEnabled = true
        let rowData = data[indexPath.section].rows[indexPath.item]
        cell.customLabel.text = rowData.type.rawValue
        if let image = imageDictionary[rowData.type] {
            cell.configure(with: image)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let controller = data[indexPath.section].rows[indexPath.item].controller
        navigationController?.pushViewController(controller, animated: true)
    
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            // Создайте и настройте представление заголовка с использованием данных из Section
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeaderView", for: indexPath) as! SectionHeaderView
            let section = data[indexPath.section]
            headerView.titleLabel.text = section.type.rawValue
            return headerView
        } else {
            return UICollectionReusableView()
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        // Укажите размер для каждого заголовка секции
        return CGSize(width: collectionView.frame.width, height: 34)
    }
    
    
}

    

