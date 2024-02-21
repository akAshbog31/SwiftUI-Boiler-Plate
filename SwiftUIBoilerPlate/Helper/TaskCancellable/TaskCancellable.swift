//
//  TaskCancellable.swift
//  SwiftUIBoilerPlate
//
//  Created by AKASH BOGHANI on 12/12/23.
//

import Foundation

// MARK: - TaskCancellable
final class TaskCancellable: Hashable {
    static func == (lhs: TaskCancellable, rhs: TaskCancellable) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    private var id = UUID()
    private var task: Task<Void, Never>

    init(task: Task<Void, Never>) {
        self.task = task
    }

    deinit {
        self.task.cancel()
    }
}

extension Task where Success == Void, Failure == Never {
    func store(in taskCancellable: inout Set<TaskCancellable>) {
        taskCancellable.insert(TaskCancellable(task: self))
    }
}
