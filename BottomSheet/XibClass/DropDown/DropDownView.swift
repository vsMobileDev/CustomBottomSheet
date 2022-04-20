//
//  DropDownView.swift
//  BottomSheet
//
//  Created by Vaibhav Sadana on 04/04/22.
//

import UIKit
protocol ListItem{
    func getSelectedItem(item:String)
}

@IBDesignable
class DropDownView: UIView {
    var option = [String]()
    @IBOutlet weak var tableView: UITableView!
    @IBInspectable
    var stringArray : String = "" {
        didSet{
            let optionArray =  stringArray.components(separatedBy: ",")
            option = optionArray
            tableView.reloadData()
        }
    }
    var delegate : ListItem?
    
    @IBOutlet var contentView: UIView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit(){
       
        Bundle.main.loadNibNamed("DropDown", owner: self)
        tableView.delegate = self
        tableView.dataSource = self
        
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.layer.cornerRadius = 4
        tableView.layer.cornerRadius = 4
        contentView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
}

extension DropDownView : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return option.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = option[indexPath.row]
        content.textProperties.font = .systemFont(ofSize: 14)
        cell.contentConfiguration = content
        if indexPath.row == option.indices.last {
            cell.separatorInset  = UIEdgeInsets(top: 0, left: cell.bounds.size.width, bottom: 0, right: 0 )
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cell = tableView.cellForRow(at: indexPath)
//        cell?.textLabel?.highlightedTextColor = .red
        self.delegate?.getSelectedItem(item: option[indexPath.row])
    }
}
