//
//  LanguageSelectorVC.swift
//  Localizer
//
//  Created by Stanly Shiyanovskiy on 3/3/19.
//  Copyright © 2019 Stanly Shiyanovskiy. All rights reserved.
//

import UIKit

public typealias Language = (type: LanguageType, value: String)

public class LanguageSelectorVC: UIViewController {
    
    // Outlets
    @IBOutlet private weak var tableView: UITableView!
    
    // Services
    private let localizer = LocalizeService.shared
    
    private let languages: [Language] = [
        Language(type: .English, value: "English"),
        Language(type: .Russian, value: "Русский"),
        Language(type: .French, value: "Français"),
        Language(type: .German, value: "Deutsch"),
        Language(type: .Ukrainian, value: "Українська")]
    
    private let classTag = "LanguageSelectorVC"
    
    public init() {
        super.init(nibName: classTag, bundle: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension LanguageSelectorVC: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languages.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = languages[indexPath.row].value
        
        return cell
    }
}

extension LanguageSelectorVC: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let lang = languages[indexPath.row].type
        localizer.update(lang)
        
        dismiss(animated: true, completion: nil)
    }
}
