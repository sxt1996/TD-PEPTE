# TD-PEPTE
open source codes of paper:《A Parameter-free Topological Disassembly-guided Method for Hyperspectral Target Detection》

DOI: 10.1109/JSTARS.2025.3587030

# Abstract
When priori information about the target is available, its specificity is characterized by significant differences in spatial distribution and spectral response compared to the background. Leveraging this fact, hyperspectral target detection can perform pixel-level target localization. Traditional model-driven methods often underperform due to the mismatches between model assumptions and real data, while data-driven methods face challenges such as complex training processes, parameter tuning, and high computational costs. To address these challenges, this paper adopts a model-free and parameter-free design philosophy. By integrating point-set topology and information theories, it extracts information features from both target and background objects to support high-precision detection. A novel method, Parameter-free Estimation of Pixel-level Topology Entropy guided by spectral-spatial disassembly, for hyperspectral target detection (TD-PEPTE), is proposed. Specifically, dual topological spaces at both pixel and image levels are constructed through spectral-spatial disassembly of a hyperspectral image (HSI), where distinguishable features between the target and background are clearly revealed. Building on this, pixel-level topology is utilized to estimate the information entropy of the testing pixel and the target separately, and their similarity is preliminarily measured by subtracting the estimated entropy values. Additionally, properties of point sets in the image-level topology are exploited to accurately quantify feature differences among various objects, further improving detection accuracy and reliability. Experiments validate the parameter-free nature of the method and compare its performance, demonstrating that TD-PEPTE offers robust, generalizable detection across diverse hyperspectral scenes.
# Index Terms
Hyperspectral image, target detection, information entropy, topology, machine learning.
# Flowchart
![Flowchart](https://github.com/user-attachments/assets/54f718fe-e531-499c-be28-b02a78f8c3a4)
# Data Set
Belcher Bay: The Belcher data set was acquired by the hyperspectral sensor aboard the Gaofen-5 (GF-5) satellite over Belcher Bay in Hong Kong, China. It comprises 150 spectral bands spanning 390~1030 nm across visible and near-infrared wavelengths, with a spatial resolution of 30 m and dimensions of 150 × 150 pixels. The scene predominantly features water bodies with minimal vegetation and built structures. Maritime vessels serve as the target to be detected, while submerged small rocks within aquatic regions may induce false alarms during the analysis.
# Guidelines
1. Install R2014a or higher versions of MATLAB.
2. Download this code package.
3. Set path.
4. Don't worry about importing data or anything else, just run Main.m.
# Contact
If you have any questions, please feel free to contact me.
sxt1996@outlook.com
