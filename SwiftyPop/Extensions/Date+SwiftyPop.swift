import Foundation

extension Date {
    func ddmmyyyFormatted() -> String {
        let df = DateFormatter()
        df.dateFormat = "dd-MM-yyyy"
        return df.string(from: self)
    }
}
