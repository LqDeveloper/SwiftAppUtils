//
//  UIImagePickerControllerExtensions.swift
//  LQAppUtils
//
//  Created by Quan Li on 2020/6/30.
//  Copyright © 2020 williamoneilchina. All rights reserved.
//
#if canImport(UIKit) && os(iOS) && canImport(Photos) && canImport(AVFoundation)
import UIKit
import Photos
import AVFoundation
public extension UIImagePickerController{
    
    /// 相册权限
    static  var photoSatus:PHAuthorizationStatus{
        return PHPhotoLibrary.authorizationStatus()
    }
    
    /// 相机权限
    static var cameraStatus:AVAuthorizationStatus{
        return AVCaptureDevice.authorizationStatus(for: .video)
    }
    
    /// 请求相册权限
    /// - Parameter complition: 请求结果
    static func checkPhotoAuthorization(complition:@escaping (PHAuthorizationStatus)->Void){
        guard photoSatus == .notDetermined else {
            complition(photoSatus)
            return
        }
        PHPhotoLibrary.requestAuthorization { (status) in
            DispatchQueue.main.async {
                complition(status)
            }
        }
    }
    
    /// 请求相机权限
    /// - Parameter complition: 请求结果
    static func checkCameraAuthorization(complition:@escaping (Bool)->Void){
        guard cameraStatus == .notDetermined else {
            if cameraStatus == .authorized {
                complition(true)
            }else{
                complition(false)
            }
            return
        }
        AVCaptureDevice.requestAccess(for: .video) { (isSuccess) in
            DispatchQueue.main.async {
                complition(isSuccess)
            }
        }
    }
    
    
    static func showPicker(_ vc:UIViewController?,_ delegate:(UIImagePickerControllerDelegate & UINavigationControllerDelegate)?, sourceType:UIImagePickerController.SourceType = .photoLibrary, allowsEditing:Bool = true,completion:(() -> Void)? = nil){
        let picker = UIImagePickerController.init()
        picker.sourceType = sourceType
        picker.delegate = delegate
        picker.allowsEditing = allowsEditing
        vc?.present(picker, animated: true, completion: completion)
    }
}


public extension Dictionary where Key == UIImagePickerController.InfoKey{
    var editedImage:UIImage?{
        return self[UIImagePickerController.InfoKey.editedImage] as? UIImage
    }
    
    var originalImage:UIImage?{
        return self[UIImagePickerController.InfoKey.originalImage] as? UIImage
    }
}
#endif
