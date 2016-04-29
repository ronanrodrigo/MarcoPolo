//
//  CurrentWeekHoursUsecaseFactory.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 22/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation

class CurrentWeekHoursUsecaseFactory {
    static func make(presenter: WorkedHoursPresenter) -> WorkedHoursUsecase {
        let gateway = PunchGatewayCoreDataFactory.make()
        let dateRangeGateway = DateRangeGatewayDates()
        return WorkedHoursUsecase(gateway: gateway, dateRangeGateway: dateRangeGateway, presenter: presenter)
    }
}