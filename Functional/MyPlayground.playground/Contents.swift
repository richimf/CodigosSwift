import UIKit

public enum CardPlasticProperties: String {
  case cardNumber
  case blockReason
  case cardBlockCode
}

public struct CardPlastic {

  public let properties: CardPlasticProperties

  // MARK: - Initializer
  public init(properties: CardPlasticProperties) {
    self.properties = properties
  }
}
extension CardPlastic {
  public func getCardPlasticJson() -> String {
    return self.properties
  }
}
