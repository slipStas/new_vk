//
//  myThreads.swift
//  lesson_1
//
//  Created by Stanislav on 01.04.2024.
//

import Foundation

class MySingletone {
    static let shared = MySingletone()
    
    let COUNT = 130
    
    private init () {}
}

class BlackThread: Thread {
    override func main() {
        for _ in 0..<MySingletone.shared.COUNT {
            print("🫥 ___name: \(String(describing: self.name))")
            usleep(120_000)
        }
    }
}

class BlueThread: Thread {
    override func main() {
        for _ in 0..<MySingletone.shared.COUNT {
            print("🥶")
            usleep(230_000)
        }
    }
}

class MyTimer: Thread {
    override func main() {
        var timeInterval = TimeInterval()
        Timer.scheduledTimer(withTimeInterval: 0.22, repeats: true) { timer in
            timeInterval += timer.timeInterval
            print("timer time interval: \(String(format: "%.2f", timeInterval)) seconds 🤖")
        }
        RunLoop.current.run(until: Date() + 12)
    }
}
