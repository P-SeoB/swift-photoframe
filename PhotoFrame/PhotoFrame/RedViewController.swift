//
//  RedViewController.swift
//  PhotoFrame
//
//  Created by 박진섭 on 2022/02/17.
//

import UIKit

class RedViewController: VCLoggingViewController {

    //다음버튼 클릭시
    @IBAction func nextButtonTouched(_ sender: UIButton) {
        guard let NextViewController = self.storyboard?.instantiateViewController(withIdentifier: "YellowViewController") else { return }
        self.navigationController?.pushViewController(NextViewController, animated: true)
    }
    //닫기 버튼 클릭시
    @IBAction func closeButtonTouched(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)

    }
}
