import Foundation

class DateUtils {

    private static let dateFormatter = DateFormatter()

    static func string(from date: Date) -> String {
        if NSCalendar.current.isDateInToday(date) {
            dateFormatter.dateFormat = "HH:mm"
        } else if NSCalendar.current.isDateInYesterday(date) {
            return "Yesterday"
        } else {
            dateFormatter.dateFormat = "dd MMM"
        }
        return dateFormatter.string(from: date)
    }
}
