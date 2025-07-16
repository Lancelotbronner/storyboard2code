//
//  IBStackView.swift
//  storyboard2code
//
//  Created by Christophe Bronner on 2025-07-16.
//

import SwiftXML

public struct IBStackView: Codable {
	
}

/*
<stackView opaque="NO" contentMode="scaleToFill" spacing="6" translatesAutoresizingMaskIntoConstraints="NO" id="90N-7g-3Kp">
	<rect key="frame" x="16" y="0.0" width="382" height="72"/>
	<subviews>
		<view contentMode="scaleToFill" horizontalHuggingPriority="252" translatesAutoresizingMaskIntoConstraints="NO" id="YKA-4j-gGr">
			<rect key="frame" x="0.0" y="0.0" width="40" height="72"/>
			<subviews>
				<imageView clipsSubviews="YES" userInteractionEnabled="NO" contentMode="scaleAspectFit" horizontalHuggingPriority="251" verticalHuggingPriority="251" image="mix" translatesAutoresizingMaskIntoConstraints="NO" id="UaZ-wj-d1h" customClass="StoryboardImage" customModule="BetterSleep" customModuleProvider="target">
					<rect key="frame" x="4" y="20" width="32" height="32"/>
					<constraints>
						<constraint firstAttribute="width" constant="32" id="NCB-aI-MCc"/>
						<constraint firstAttribute="width" secondItem="UaZ-wj-d1h" secondAttribute="height" multiplier="1:1" id="rJ7-KE-iEP"/>
					</constraints>
					<userDefinedRuntimeAttributes>
						<userDefinedRuntimeAttribute type="string" keyPath="imageName" value="mix"/>
					</userDefinedRuntimeAttributes>
				</imageView>
			</subviews>
			<color key="backgroundColor" white="0.0" alpha="0.0" colorSpace="custom" customColorSpace="genericGamma22GrayColorSpace"/>
			<constraints>
				<constraint firstAttribute="width" constant="40" id="ajF-Mt-BBI"/>
				<constraint firstItem="UaZ-wj-d1h" firstAttribute="centerX" secondItem="YKA-4j-gGr" secondAttribute="centerX" id="rMb-9f-hCY"/>
				<constraint firstItem="UaZ-wj-d1h" firstAttribute="centerY" secondItem="YKA-4j-gGr" secondAttribute="centerY" id="zRj-Qh-m8R"/>
			</constraints>
		</view>
		<label opaque="NO" userInteractionEnabled="NO" contentMode="left" horizontalHuggingPriority="251" verticalHuggingPriority="251" text="Title" textAlignment="natural" lineBreakMode="tailTruncation" baselineAdjustment="alignBaselines" adjustsFontSizeToFit="NO" translatesAutoresizingMaskIntoConstraints="NO" id="sGm-dl-GBz" customClass="StoryboardLabel" customModule="BetterSleep" customModuleProvider="target">
			<rect key="frame" x="46" y="0.0" width="31.5" height="72"/>
			<fontDescription key="fontDescription" name="AvertaStdPE-Regular" family="Averta Std PE" pointSize="16"/>
			<color key="textColor" white="1" alpha="1" colorSpace="custom" customColorSpace="genericGamma22GrayColorSpace"/>
			<nil key="highlightedColor"/>
			<userDefinedRuntimeAttributes>
				<userDefinedRuntimeAttribute type="string" keyPath="localizedKey" value="Title"/>
			</userDefinedRuntimeAttributes>
		</label>
		<view contentMode="scaleToFill" translatesAutoresizingMaskIntoConstraints="NO" id="9EG-Iq-6lo">
			<rect key="frame" x="83.5" y="0.0" width="298.5" height="72"/>
			<subviews>
				<switch opaque="NO" contentMode="scaleToFill" horizontalHuggingPriority="750" verticalHuggingPriority="750" contentHorizontalAlignment="center" contentVerticalAlignment="center" on="YES" translatesAutoresizingMaskIntoConstraints="NO" id="iUW-SR-RK5">
					<rect key="frame" x="249.5" y="20.5" width="51" height="31"/>
					<connections>
						<action selector="didTapSwitch" destination="oMa-Zq-qlz" eventType="valueChanged" id="sXH-KT-dgM"/>
					</connections>
				</switch>
			</subviews>
			<color key="backgroundColor" white="0.0" alpha="0.0" colorSpace="custom" customColorSpace="genericGamma22GrayColorSpace"/>
			<constraints>
				<constraint firstItem="iUW-SR-RK5" firstAttribute="centerY" secondItem="9EG-Iq-6lo" secondAttribute="centerY" id="taL-gG-u8D"/>
				<constraint firstAttribute="trailing" secondItem="iUW-SR-RK5" secondAttribute="trailing" id="ytq-h0-Ji1"/>
			</constraints>
		</view>
	</subviews>
	<viewLayoutGuide key="safeArea" id="lS0-GP-Uq5"/>
</stackView>
*/
