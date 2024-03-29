//
//  AssemblyFactory.swift
//  timetracker
//
//  Created by Polina Egorova on 14.03.2024.
//

protocol AssemblyFactory {
    
    func timerModuleAssembly() -> TimerModuleAssembly
    
    func goalsModuleAssembly() -> GoalsModuleAssembly
    
    func analyticsModuleAssembly() -> AnalyticsModuleAssembly
    
    func actionsModuleAssembly() -> ActionsModuleAssembly
}

final class AssemblyFactoryImpl {

    static let shared = AssemblyFactoryImpl()

    // MARK: - Private properties

    private let _timerModuleAssembly = TimerModuleAssembly()
    private let _goalsModuleAssembly = GoalsModuleAssembly()
    private let _analyticsModuleAssembly = AnalyticsModuleAssembly()
    private let _actionsModuleAssembly = ActionsModuleAssembly()
    
    // MARK: - Init

    private init() { }
}

extension AssemblyFactoryImpl: AssemblyFactory {
    func timerModuleAssembly() -> TimerModuleAssembly {
        return _timerModuleAssembly
    }
    
    func goalsModuleAssembly() -> GoalsModuleAssembly {
        return _goalsModuleAssembly
    }
    
    func analyticsModuleAssembly() -> AnalyticsModuleAssembly {
        return _analyticsModuleAssembly
    }
    
    func actionsModuleAssembly() -> ActionsModuleAssembly {
        return _actionsModuleAssembly
    }
}
