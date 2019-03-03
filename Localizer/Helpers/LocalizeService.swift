//
//  LocalizeService.swift
//  Localizer
//
//  Created by Stanly Shiyanovskiy on 3/3/19.
//  Copyright © 2019 Stanly Shiyanovskiy. All rights reserved.
//

public enum LanguageType {
    case English
    case Russian
    case French
    case German
    case Ukrainian
    
    public var langCode: String {
        switch self {
        case .English: return "en"
        case .Russian: return "ru"
        case .French: return "fr"
        case .German: return "de"
        case .Ukrainian: return "uk"
        }
    }
}

public protocol Localizable {
    func update(_ lang: LanguageType)
}

public class LocalizeService {
    
    static let shared = LocalizeService()
    public var delegate: Localizable?
    
    init() { }
    
    public func update(_ lang: LanguageType) {
        delegate?.update(lang)
    }
}
