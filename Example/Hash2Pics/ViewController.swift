//
//  ViewController.swift
//  Hash2Pics
//
//  Created by Pidji on 06/25/2018.
//  Copyright (c) 2018 Pidji. All rights reserved.
//

import UIKit
import Hash2Pics

class ViewController: UIViewController {
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    
    let addresses = ["1KpCMHzox8ykqUbPXvZQeFNLhk1VT52SA3",
                     "1MHFB1WdnAcGhny6gmBPBom3k2tzwx9odK",
                     "155fiyuVUZBKokthobpV15wX2tWcnx4QJV",
                     "13a9pYjsDHn1BbDp5xCGNpUhBKzP3DnYmS",
                     "1Q799Fuy5wdbhYxTCTXJTk8zMqezTKyP3t",
                     "1AsssK3LSBV1fJTC31cUtKNjt9vNiHMDYM",
                     "14r2KxwXy59gPePozihZ1Cqdg36btYPsQM",
                     "1M3BTYcHAY8NvcQLFDeCzbnXYVcMfvVgEo",
                     "1LVqGYoPQmqozphHAEnZntSapTCgtDUKqK",
                     "17gzeas1eMJuHEzqqSzzAWpDLzoaEwSXMZ",
                     "1BQYqaPao5NV51h9XGfSabU2WohqC7o2xs",
                     "3MACG7u4126RvfM43z34bnfAux4sQbDksA",
                     "1or47fEeKAmTYrMyoMGYDQeYgezKtxzzW",
                     "1MHFB1WdnAcGhny6gmBPBom3k2tzwx9odK",
                     "DFb0f70764847b3a2016D5F5912e7977E5eEA0C5",
                     "155fiyuVUZBKokthobpV15wX2tWcnx4QJV",
                     "3MACG7u4126RvfM43z34bnfAux4sQbDksA",
                     "1or47fEeKAmTYrMyoMGYDQeYgezKtxzzW",
                     "1JSzWKC9Whk9DjbUGen9KjpAQTVSFusnQw",
                     "1LVqGYoPQmqozphHAEnZntSapTCgtDUKqK",
                     "1AkSTRSb5fycFcd2uMjrkTmf6FjrLvnPNc",
                     "1MiMHXCMQfRZsmcxkJ7hhuTTWE6YTmyHoN",
                     "1cHcGKCNx9g1xA5m6F8xbZ8Ue597SMp1Q",
                     "1HryQyuvEtMjZPBCP67nx1JGQ7krB7snE6",
                     "1AkSTRSb5fycFcd2uMjrkTmf6FjrLvnPNc",
                     "1JSzWKC9Whk9DjbUGen9KjpAQTVSFusnQw",
                     "3GuixTgqPEZSS4iCPH3CWKsEhUc3Ru1yzj",
                     "1AwzLWaXXJbLudHe5L6rfUYUPnRw3BTv3a",
                     "1P3gjxpPGFQ1V5XSQsLZo4bHwY7hF5RNrC",
                     "1Lz3MfNmJpDW9kYCeCUBTJFJZGxFCcJzDA",
                     "1DLj4rJWf9r13iwEdx9rHcYAe15YfCcryR",
                     "1G4k6kPivJBaHCHYXvLDW2G5FXeZEitxrb",
                     "33UKotzBHWNFBkoQSyXfHiHcvLE9rKLUME",
                     "14C4PtqWetZ7LxdYChx1jADGzu2tvZVtcs",
                     "1ABPpo1g9nwy98A77umLvbgpXKFrAUYMhV",
                     "18LPmX3cRBDdQhQ3hXoYbYgqGRKtZw3PgY",
                     "3QEgn3F5c1d2vXaovjA2Lh4znqJjkaDtpT",
                     "1Dnrdtj6ZyPAntVbfDxofmCAFfyM8QK6LJ",
                     "3PWwHQPPwtg4RCkMopNoyThjUavEEKSW1U",
                     "3Qe3bMqCkA8fQaqUxs9F2ADASuLw1YVHKK",
                     "1FiWnky792CBQuLJSSGhxyoPzzYaf9xqJS",
                     "1DSCMsPCGqFGK3WDNSL2oD1pPKUnaGUfY4",
                     "1P421hd7865PteSuUPof2eVGf6aYeperX8",
                     "1Kunn2kTe5yztGTuSNEMwzDcxfwd3t5nx4",
                     "1B84PnT5GtNXyArAWh8hdKnrzL56A4FMCV",
                     "3Pks6rKNwNSm9fFxgXRdMaqtXAoMMViCPf",
                     "1KZwuyR9QHJDbBEQgyggjWXaYYVc4voSH3",
                     "15SCFYDLrzuN2nhm6X6vJgunEnhGVsqXLd",
                     "1HHKHkChhMYX77mmn9M78EKP3VTNUkr459",
                     "1GfQiRnpi3ghs1AStE2QdgfNxM5jzLz2xV",
                     "1E4ViiDUcoWnCjd7RQgXt8x7V7ibGMrnaB",
                     "19X8SY3a2X7PHqWAYL5UPckG7kH5ES3dPZ",
                     "1JE5Ubozq4NCcJKoTfwBkJxwXou2D7odxs",
                     "1GJwHs6F23aQkfGeo1xaRRYEAgo9Bx8F6i",
                     "16JLpQ5hog7szTQUaawyTpMrzWmVP11ffW",
                     "3Nfw2M2nW5U3LiJomrj6zXAaaXynAqu4sV",
                     "14YAR3w3GR9kXZVx4hDwR9SRKyzHeUtKeq",
                     "1M3BTYcHAY8NvcQLFDeCzbnXYVcMfvVgEo",
                     "3D2oetdNuZUqQHPJmcMDDHYoqkyNVsFk9r",
                     "16ftSEQ4ctQFDtVZiUBusQUjRrGhM3JYwe",
                     "16rCmCmbuWDhPjWTrpQGaU3EPdZF7MTdUk",
                     "3Nxwenay9Z8Lc9JBiywExpnEFiLp6Afp8v",
                     "3Cbq7aT1tY8kMxWLbitaG7yT6bPbKChq64",
                     "1KAt6STtisWMMVo5XGdos9P7DBNNsFfjx7",
                     "1FeexV6bAHb8ybZjqQMjJrcCrHGW9sb6uF",
                     "18rnfoQgGo1HqvVQaAN4QnxjYE7Sez9eca",
                     "1HQ3Go3ggs8pFnXuHVHRytPCq5fGG8Hbhx",
                     "1PnMfRF2enSZnR6JSexxBHuQnxG8Vo5FVK",
                     "1AhTjUMztCihiTyA4K6E3QEpobjWLwKhkR",
                     "1DiHDQMPFu4p84rkLn6Majj2LCZZZRQUaa",
                     "1EBHA1ckUWzNKN7BMfDwGTx6GKEbADUozX",
                     "1LdRcdxfbSnmCYYNdeYpUnztiYzVfBEQeC",
                     "c5b1e4e6bc41c227fe3615e23003f9d978b9e479",
                     "971e78e0c92392a4e39099835cf7e6ab535b2227",
                     "c5b1e4e6bc41c227fe3615e23003f9d978b9e479",
                     "93770f4bf7455237e5e9373d1fb49f8d3e7a20f2",
                     "dbdf022d9ed6b7dcf931cf4886e25f0f510c101d",
                     "b7e504ca6622cc0273b7eee732986de438ec9390",
                     "2aa1c0c08a0b9840b5c8afaaf26fced86ea66eda",
                     "a1e078d740bcd6843515a3963fc5da8f51d92b8b",
                     "32f5863ac30424c0f43902ab49f5f61efca79d53",
                     "cba22fa719f0f629b30cb4719d2c3eca114124ce",
                     "840a0f6c1e4e580dcbe67f96da3d3b024831b482",
                     "733f275a603b6052cd88101d11c040fb6636fe53",
                     "0f4e593b5bde8e479107ecb29b6ea7ae0eb08ce3",
                     "2ddf65822accec2478b9e076c9b7ff5c75ae6c37",
                     "40fe816f5ae9bf3a5c0578416dfa724e1291891d",
                     "29e07176898a6c9ebd161296ec3c71c88084c229",
                     "d0f4577f655f32def9d944a25e1b7f22e544664c",
                     "32b4f6eb35d649bddaea370c8ad1793ad35f8f4c",
                     "8b476ed7cc22c75cb2824e3c24719f8c99bb8f9a",
                     "2a0c0dbecc7e4d658f48e01e3fa353f44050c208",
                     "000a75366be0e6a5f81255726acf9497636f35d2",
                     "150ae4472ea265cdd9c119f8f16620c14e1552ad",
                     "c6f2b50006d0210886d12acebf8a6bb0d99793c2",
                     "05142cde5ae854949b57646bf207f638381b0b9d",
                     "9acba9e96a97e2a7cc94d81840fbbd826e0cc3e5",
                     "4263c0c335041dc452e153f1a10ec9c45eed6dd3",
                     "fb0f55ea5a21b298cf753ae361cfb9f2a6327225",
                     "ee51344e91b637627c4ebcd9228eca1a02a49804",
                     "ae42189dd5a41c355a67ebedc4a4a75b1690e4bc",
                     "2a69451b414870a1592695f8cb9dbfa926993ee1",
                     "034f7952c036854dd1dcb3f9c83391db0bdafa71",
                     "f597cf12b5010c98c9a0361b9536d11381083d6b",
                     "e8a8ffc888a4c078b09974ed0af9bee1ececc056",
                     "29a13a615c024cb65ba00b890b30e2caad92bb52",
                     "fa6fd86b42ce2ec5e00c1cd35fb0c78bd88c0417",
                     "95c1fecbf33b12176900dc57a1938ed9f6867073",
                     "eac7f25db3423f2414f1a2b7f62508586d50b80a",
                     "9d057615592fe258522730ca0a0886a584a63090",
                     "f3387c6ae2806a6f647724bf87a92e828d1b5f70",
                     "6279168bd76a34f265ab4aa1e69bd9a06d463142",
                     "e090ecd1d1ca6df8f61ab23a7746a48dad5a563e",
                     "e6d439d46ef83df04f43336c652cff9241b6a2bc",
                     "2a0c0dbecc7e4d658f48e01e3fa353f44050c208",
                     "3269f80c945a3a9c0f77ca2e88bd7b13661f8444",
                     "a5eddeac2d717fa6e199f8ae6c4a46db739caf31",
                     "5c97eaa5bc671c8fb82977cfcb941040d2b07032",
                     "114c6439fb8d70dd3e5cd595af2280ee524f832f",
                     "c5b1e4e6bc41c227fe3615e23003f9d978b9e479",
                     "ab1c7cf217fa5f0dc49db059f697922381e9a660",
                     "4c84fa6f15557aeb603137bdc604796e3732b962",
                     "2e4f41280c554f64360a977ca28489e0d738ab17",
                     "7807ddc10531399e659bd0983044694873bc49d4",
                     "3a7631a0788f34904703e10947d4cd6a6d02d8af",
                     "6a992f9c907287b4423d8ae310ce515573c49dbd",
                     "85f20db5acd3118453115c1c3dc0e774391a3a2e",
                     "05ff092cc2200fe38db8971391e04e60c1e2702f",
                     "ae2212e229fb1874bd38f7dab840c2542d8da68b",
                     "f3ff9bfba0d33bbe6ea8e1879df637587f3f03b3",
                     "ee85bf2623aa3150ae8b57667fcd11def57f3034",
                     "4bf9db592bc0b550bf5f98e953afcb3e0724b2d1",
                     "4f08031b92e9a83b0fd20239089643988a472a49",
                     "f1f0d25b4fd1b5980ff86a96efd19a3972491d57",
                     "10bb93935b798b8f788a32fd7e2e5ff2a07b1b29"]
    
    var currentIndex = 0 {
        didSet {
            updateUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        updateUI()
    }
    
    func updateUI() {
        let address = addresses[currentIndex]
        addressLabel.text = address
        
        let ava = AvaConstuctor().generate(diameter: avatarImageView.frame.size.width, seed: addresses[currentIndex])
        guard ava != nil else {
            return
        }
        
        avatarImageView.image = ava!
        avatarImageView.layer.shadowRadius = 10
        avatarImageView.layer.shadowOpacity = 0.5
    }
    
    @IBAction func nextAction(_ sender: Any) {
        if currentIndex == (addresses.count - 1) {
            currentIndex = 0
        } else {
            currentIndex += 1
        }
    }
}


