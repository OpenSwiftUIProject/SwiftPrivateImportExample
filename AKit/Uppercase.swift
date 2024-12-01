extension Foo {
    private static var cache: [String: String] = [:]
    
    static func _upper(for key: String) -> String {
        if let value = cache[key] {
            return value
        } else {
            let result = key.uppercased()
            cache[key] = result
            return result
        }
    }
}
