//
//  BKit.swift
//  BKit
//
//  Created by Kyle on 2024/12/1.
//

@_private(sourceFile: "Uppercase.swift")
import AKit

//@_private(sourceFile: "Lowercase.swift")
//import AKit

@main
@MainActor
struct BKit {
    static func main() {
        _ = Foo.upper(for: "hello")
        _ = Foo.lower(for: "WORLD")
        // Private upper case cache for Foo is accessible here
        print(Foo.cache) // ["hello": "HELLO"]
    }
}
