//
//  PupleViewController.swift
//  PhotoFrame
//
//  Created by 박진섭 on 2022/02/17.
//

import UIKit

class PurpleViewController: VCLoggingViewController {
    
    //다음 버튼 클릭시
    @IBAction func nextButtonTouched(_ sender: UIButton) {
        guard let NextViewController = self.storyboard?.instantiateViewController(withIdentifier: "RedViewController") else { return }
        self.navigationController?.pushViewController(NextViewController, animated: true) //설정한 VC로 Push한다
        
    }
    
    //닫기 버튼 클릭시
    @IBAction func closeButtonTouched(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true) //view를 pop한다

    }
}
