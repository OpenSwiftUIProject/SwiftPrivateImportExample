extension Foo {
    private static var cache: [String: String] = [:]
    
    static func _lower(for key: String) -> String {
        if let value = cache[key] {
            return value
        } else {
            let result = key.lowercased()
            cache[key] = result
            return result
        }
    }
}
