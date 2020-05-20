//
//  DispatchQueueExtensions.swift
//  SwiftAppUtils
//
//  Created by Quan Li on 2018/7/11.
//  Copyright © 2019 Quan Li. All rights reserved.
//


#if canImport(Dispatch) &&  canImport(Foundation)
import Dispatch
import Foundation
// MARK: - Properties
public extension DispatchQueue {
    
    /// 判断当前线程是否是主线程
    static var isMainQueue: Bool {
        enum Static {
            static var key: DispatchSpecificKey<Void> = {
                let key = DispatchSpecificKey<Void>()
                DispatchQueue.main.setSpecific(key: key, value: ())
                return key
            }()
        }
        return DispatchQueue.getSpecific(key: Static.key) != nil
    }
    
    
    /// 判断当前线程是否是指定的线程
    /// - Parameter queue: 指定的线程
    static func isCurrent(_ queue: DispatchQueue) -> Bool {
        let key = DispatchSpecificKey<Void>()
        
        queue.setSpecific(key: key, value: ())
        defer { queue.setSpecific(key: key, value: nil) }
        
        return DispatchQueue.getSpecific(key: key) != nil
    }
    
    
    /// 在主线程运行
    /// - Parameter execute: execute
    static func runAsyncOnMainQueue(_ execute:@escaping () -> Void){
        DispatchQueue.main.async(execute: execute)
    }
    
    
    /// 在global线程运行
    /// - Parameters:
    ///   - qos: QoS的全称是quality of service。就是当资源有限的时候，优先执行哪些任务。这些优先级包括 CPU 时间，数据 IO 等等，
    ///   也包括 ipad muiti tasking（两个App同时在前台运行）
    ///        userInteractive： 和用户交互相关，比如动画等等优先级最高。比如用户连续拖拽的计算
    ///        userInitiated： 需要立刻的结果，比如push一个ViewController之前的数据计算
    ///        utility： 可以执行很长时间，再通知用户结果。比如下载一个文件，给用户下载进度。
    ///        background： 用户不可见，比如在后台存储大量数据
    ///        defalut:默认任务的优先级低于user-initiated和user-interactive，但优先级高于utility和background。
    ///        将此类分配给应用启动或代表用户执行活动的任务或队列。
    ///   - execute: 执行block
    static func runAsyncOnGlobalQueue(_ qos: DispatchQoS.QoSClass = .default,_ execute:@escaping () -> Void){
        DispatchQueue.global(qos: qos).async(execute: execute)
    }
    
    static func runAsyncOnGlobalQueue(_ execute:@escaping () -> Void){
        DispatchQueue.global(qos: .default).async(execute: execute)
    }
    
    static func runSyncOnGlobalQueue(_ qos: DispatchQoS.QoSClass = .default,_ execute:@escaping () -> Void){
        DispatchQueue.global(qos: qos).sync(execute: execute)
    }
    
    
    
    /*
     主队列      全局队列     串行队列    并行队列
     同步  X          并行同步     串行同步     并行同步
     异步  串行异步     并行异步      串行异步    并行异步
     
     label 表示队列标签
     qos 表示设置队列的优先级
     .userInteractive 需要用户交互的，优先级最高，和主线程一样
     .userInitiated 即将需要，用户期望优先级，优先级高比较高
     .default 默认优先级
     .utility 需要执行一段时间后，再通知用户，优先级低
     .background 后台执行的，优先级比较低
     .unspecified 不指定优先级，最低
     attributes 表示队列类型，默认为串行队列，设置为.concurrent表示并行队列。iOS 10.0之后 attributes 新增.initiallyInactive属性表示当前队列是不活跃的，它需要调用DispatchQueue的activate方法来执行任务。
     
     autoreleaseFrequency 表示自动释放频率，设置自动释放机制。
     .inherit 表示不确定，之前默认的行为也是现在的默认值
     .workItem 表示为每个执行的项目创建和排除自动释放池, 项目完成时清理临时对象
     .never 表示GCD不为您管理自动释放池
     
     // 创建并行队列，并手动触发
     let concurrentQueue2 = DispatchQueue(label:"com.geselle.concurrentQueue2", qos: .utility,attributes[.concurrent,.initiallyInactive])
     //手动触发
     if let queue = inactiveQueue {
     queue.activate()
     }
     */
    /// 生成并发队列
    /// - Parameters:
    ///   - label: 队列的标识符，方便调试
    ///   - qos:  队列的quality of service。用来指明队列的“重要性”，后文会详细讲到。
    ///   - autoreleaseFrequency:顾名思义，自动释放频率。有些队列是会在执行完任务后自动释放的，
    ///              有些比如Timer等是不会自动释放的，是需要手动释放。
    ///   - target: target
    /// - Returns: DispatchQueue
    @available(iOS 10.0, *)
    static func concurrentQueue(_ label:String,_ qos: DispatchQoS = .default,_ autoreleaseFrequency: AutoreleaseFrequency = .workItem,_ target: DispatchQueue? = nil) -> DispatchQueue{
        
        return DispatchQueue.init(label: label, qos: qos, attributes: DispatchQueue.Attributes.concurrent, autoreleaseFrequency: autoreleaseFrequency, target: target)
    }
    
    /// 生成串行队列
    /// - Parameter label: 队列的标识符，方便调试
    /// - Returns: DispatchQueue
    static func serialQueue(_ label:String) -> DispatchQueue{
        return DispatchQueue.init(label: label)
    }
    
}
#endif
