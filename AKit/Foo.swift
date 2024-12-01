@MainActor
public enum Foo {
    public static func upper(for key: String) -> String {
        _upper(for: key)
    }
    
    public static func lower(for key: String) -> String {
        _lower(for: key)
    }
}
