import Foundation

public class TotalWorkedHoursEntity {
    private let inputPunchs: [Punch]
    private let outputPunchs: [Punch]

    public init (inputPunchs: [Punch], outputPunchs: [Punch]) {
        self.inputPunchs = inputPunchs
        self.outputPunchs = outputPunchs
    }

    public func calculate() -> NSTimeInterval {
        var totalInterval: NSTimeInterval = 0.0

        for (index, inputPunch) in inputPunchs.enumerate() {
            if existPunch(at: index, on: outputPunchs) {
                let outputPunch = outputPunchs[index]
                totalInterval += outputPunch.moment.timeIntervalSinceDate(inputPunch.moment)
                if outputPunch.moment.isSunday() {
                    totalInterval *= 1.5
                }
                if isOutputPunchGreatherThanInputPunch(totalInterval) {
                    totalInterval = 0.0
                }
            }
        }

        return totalInterval
    }

    private func existPunch(at index: Int, on punchs: [Punch]) -> Bool {
        return index <= punchs.count-1
    }

    private func isOutputPunchGreatherThanInputPunch(totalInterval: Double) -> Bool {
        return totalInterval < 0
    }
}
