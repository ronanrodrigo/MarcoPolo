import Foundation
import SwiftDate

class WorkedHoursUsecase {
    private var gateway: PunchGateway
    private var presenter: WorkedHoursPresenter

    init(gateway: PunchGateway, presenter: WorkedHoursPresenter) {
        self.gateway = gateway
        self.presenter = presenter
    }

    func workedHours() {
        let workHours = WorkHourType.types.map({ calculateHours($0) })
        presenter.showTotal(workHours)
    }

    private func calculateHours(type: WorkHourType) -> WorkHour {
        let inputPunchs = gateway.list(by: .Input, between: type.dateRange.firstDate, and: type.dateRange.lastDate)
        let outputPunchs = gateway.list(by: .Output, between: type.dateRange.firstDate, and: type.dateRange.lastDate)
        let total = TotalWorkedHoursEntity(inputPunchs: inputPunchs, outputPunchs: outputPunchs).calculate()
        let mandatoryHours = 0.0
        let balance = BalanceWorkedHoursEntity(totalHours: total, mandatoryHours: mandatoryHours).calculate()

        return WorkHourStruct(type: type, total: total, balance: balance)
    }
}
