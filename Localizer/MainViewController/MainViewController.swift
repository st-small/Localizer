//
//  MainViewController.swift
//  Localizer
//
//  Created by Stanly Shiyanovskiy on 3/3/19.
//  Copyright © 2019 Stanly Shiyanovskiy. All rights reserved.
//

import UIKit

public class MainViewController: UIViewController {
    
    // Outlets
    @IBOutlet private weak var greetingLabel: UILabel!
    @IBOutlet private weak var selectionButton: UIButton!
    
    // Services
    private let localizer = LocalizeService.shared
    
    private let classTag = "MainViewController"
    
    public init() {
        super.init(nibName: classTag, bundle: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        localizer.delegate = self
        localizer.update(.English)
    }
    
    private func updateLocalizableValues(_ type: LanguageType) {
        let language = type.langCode
        let path = Bundle.main.path(forResource: language, ofType: "lproj")!
        let bundle = Bundle(path: path)!
        
        let greetingString = NSLocalizedString("Hello", bundle: bundle, comment: "")
        greetingLabel.text = greetingString
        
        let buttonTextString = NSLocalizedString("Select current language", bundle: bundle, comment: "")
        selectionButton.setTitle(buttonTextString, for: .normal)
    }
}

extension MainViewController: Localizable {
    public func update(_ lang: LanguageType) {
        updateLocalizableValues(lang)
    }
}

// MARK: - Actions -

extension MainViewController {
    
    @IBAction private func selectLanguageView(_ sender: UIButton) {
        let selector = LanguageSelectorVC()
        self.navigationController?.present(selector, animated: true, completion: nil)
    }
}
