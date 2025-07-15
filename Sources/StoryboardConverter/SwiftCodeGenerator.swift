//
//  SwiftCodeGenerator.swift
//  storyboard2code
//
//  Created by Watanabe Toshinori on 11/1/18.
//

import Foundation
import Stencil
import StencilSwiftKit
import StoryboardModel

public enum CodeGenType: String {
    case `class`
    case `extension`
}

public class SwiftCodeGenerator: NSObject {
    
    var document: IBDocument!
    
    var codegen: CodeGenType = .class
    
    // MARK: - Initialize
    
    public init(document: IBDocument, codegen: CodeGenType) {
        super.init()
        self.document = document
        self.codegen = codegen
    }
    
    // MARK: - Generate code
    
    public func generate() -> String {
        var environment = stencilSwiftEnvironment()
        environment.extensions.append(SwiftCodeExtension.extension())

        let template = StencilSwiftTemplate(templateString: kSwiftCodeTemplate, environment: environment)
        do {
            let source = try template.render(["document": document, "codegen": codegen.rawValue])
            return source
        } catch {
            print(error.localizedDescription)
        }
        
        return ""
    }
    
}

