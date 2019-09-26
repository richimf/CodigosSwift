import Foundation

public typealias action = () -> Void
public func example(of description: String, action: action) {
  print("\n--- Example of:", description, "---")
  action()
}
