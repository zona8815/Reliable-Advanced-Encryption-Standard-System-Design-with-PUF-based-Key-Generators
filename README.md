# Reliable-Advanced-Encryption-Standard-System-Design-with-PUF-based-Key-Generators

## Abstract
Hardware Trojans and side channel attacks have become serious threatens for modern cryptoprocessors. One of the attacker’s goals is stealing key information for encryption and decryption algorithms. Therefore, it is important to find robust techniques to protect the key information. With the properties of robust, unique, easy to evaluate, difficult to replicate, and very difficult or impossible to predict, it has been shown that Physically Unclonable Function (PUF) is a promising cryptographic primitive to be a key generator. In this paper, we propose a reliable Advanced Encryption Standard (AES) system which applies Arbiter PUF (APUF) and Ring-Oscillator PUF (ROPUF) as key generators. We implement our AES system with PUFs on different FPGAs, and demonstrate the effectiveness of different PUF designs as key generators to protect the encryption circuit and decryption circuit of AES system. Moreover, we carefully study how the different place-and-route settings on FPGA influence the PUF behavior. Finally, we show the resource utilization and power analysis results on Xilinx Zynq-7000 SoC ZC702. Experimental show that our design not only can successfully provide reliable key to AES but also introduce acceptable design overhead. 

## Implementation
Xilinx EGO-XA7
Xilinx Zynq-7000 SoC ZC702

## Reference
[1]	Xue, M., Gu, C., Liu, W., Yu, S. and O'Neill, M. (2020), Ten years of hardware Trojans: a survey from the attacker's perspective. IET Comput. Digit. Tech., 14: 231-246. doi: 10.1049/iet-cdt.2020.0041 <br>
[2]	G. E. Suh and S. Devadas, "Physical Unclonable Functions for Device Authentication and Secret Key Generation," 2007 44th ACM/IEEE Design Automation Conference, 2007, pp. 9-14.<br>
[3]	C. Herder, M. Yu, F. Koushanfar and S. Devadas, "Physical Unclonable Functions and Applications: A Tutorial," in Proceedings of the IEEE, vol. 102, no. 8, pp. 1126-1141, Aug. 2014, doi: 10.1109/JPROC.2014.2320516.<br>
[4]	Maiti, A., Schaumont, P., "Improved Ring Oscillator PUF: An FPGA-friendly Secure Primitive", J Cryptol 24, 375–397, 2011, doi: 10.1007/s00145-010-9088-4<br>
[5]	S. S. Kumar, J. Guajardo, R. Maes, G. Schrijen and P. Tuyls, "Extended abstract: The butterfly PUF protecting IP on every FPGA," 2008 IEEE International Workshop on Hardware-Oriented Security and Trust, 2008, pp. 67-70, doi: 10.1109/HST.2008.4559053.<br>
[6]	W. Yan, C. Jin, F. Tehranipoor and J. A. Chandy, "Phase calibrated ring oscillator PUF design and implementation on FPGAs," 2017 27th International Conference on Field Programmable Logic and Applications (FPL), 2017, pp. 1-8, doi: 10.23919/FPL.2017.8056859.<br>
[7]	National Institute of Standards and Technology, "Announcing the ADVANCED ENCRYPTION STANDARD (AES)," Federal Information Processing Standards Publication 197, Nov 2001, doi: 10.6028/NIST.FIPS.197<br>
[8]	Y. Wen, S. F. Ahamed and W. Yu, "A Novel PUF Architecture Against Non-Invasive Attacks," 2019 ACM/IEEE International Workshop on System Level Interconnect Prediction (SLIP), 2019, pp. 1-5, doi: 10.1109/SLIP.2019.8771329.<br>
[9]	Durvaux, F., Kerckhof, S., Regazzoni, F., Standaert, FX. (2014). A Survey of Recent Results in FPGA Security and Intellectual Property Protection. In: Markantonakis, K., Mayes, K. (eds) Secure Smart Embedded Devices, Platforms and Applications. Springer, New York, NY. doi: 10.1007/978-1-4614-7915-4_9.<br>
[10]	T. Cultice, C. Labrado and H. Thapliyal, "A PUF Based CAN Security Framework," 2020 IEEE Computer Society Annual Symposium on VLSI (ISVLSI), 2020, pp. 602-603, doi: 10.1109/ISVLSI49217.2020.00094.<br>
[11]	M. Bhargava and K. Mai, "An efficient reliable PUF-based cryptographic key generator in 65nm CMOS," 2014 Design, Automation & Test in Europe Conference & Exhibition (DATE), 2014, pp. 1-6, doi: 10.7873/DATE.2014.083.<br>

