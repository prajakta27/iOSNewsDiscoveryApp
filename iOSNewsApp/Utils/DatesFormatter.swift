//
//  DatesFormatter.swift
//  iOSNewsApp
//
//  Created by Prajakta Kiran Patil on 14/11/22.
//

import Foundation

class DateFormatterClass: NSObject {
   
    class func getCurrentShortDate() -> String {
        let todaysDate = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let DateInFormat = dateFormatter.string(from: todaysDate as Date)

        return DateInFormat
    }
    

    

    class func getFormattedDate(serverTime: String, fromFormat: String , toFormat: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = fromFormat
        let serverDate = formatter.date(from: serverTime)
        formatter.dateFormat = toFormat
        if let date = serverDate {
            let internationalTime = formatter.string(from: date)
            return internationalTime
        }
        else {
            return ""
        }
    }
    
    
    class func timeInterval(timeAgo:String) -> String
        {
            
            getFormattedDate(serverTime: timeAgo, fromFormat: "yyyy-MM-dd'T'HH:mm:ssZ", toFormat: "h:mma"  )
                let time1 = "10:30AM"
                  let time2 = "1:20PM"

                  let formatter = DateFormatter()
                  formatter.dateFormat = "h:mma"

                  let date1 = formatter.date(from: time1)!
                  let date2 = formatter.date(from: time2)!

                  let elapsedTime = date2.timeIntervalSince(date1)

                  // convert from seconds to hours, rounding down to the nearest hour
                  let hours = floor(elapsedTime / 60 / 60)

                  // we have to subtract the number of seconds in hours from minutes to get
                  // the remaining minutes, rounding down to the nearest minute (in case you
                  // want to get seconds down the road)
                  let minutes = floor((elapsedTime - (hours * 60 * 60)) / 60)

                if Int(hours) == 0
                {
                    return "\(Int(minutes)) mins ago"
                 } else {
                    return "\(Int(hours)) hrs ago"
                }
            }

}

