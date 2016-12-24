//
//  ViewController.swift
//  ChartsDemo
//
//  Created by Shahin on 2016-12-23.
//  Copyright © 2016 98%Chimp. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController, ChartViewDelegate
{

    @IBOutlet weak var pieChartView: PieChartView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        title = "The Best Pie Chart Ever"
        
        setupPieChartView(pieChartView)
        
        pieChartView.delegate = self
        
        updateChartData()
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        
    }

    func setupPieChartView(_ chartView: PieChartView)
    {
        chartView.usePercentValuesEnabled = true
        chartView.drawSlicesUnderHoleEnabled = false
        chartView.holeRadiusPercent = 0.50
        chartView.transparentCircleRadiusPercent = 0.53
        chartView.chartDescription?.enabled = false
        chartView.setExtraOffsets(left: 5, top: 10, right: 5, bottom: 5)
        chartView.drawCenterTextEnabled = true
        
        chartView.drawHoleEnabled = true
        chartView.rotationAngle = 0.0
        chartView.rotationEnabled = true
        chartView.highlightPerTapEnabled = true
        
        let legend = chartView.legend
        legend.horizontalAlignment = .right
        legend.verticalAlignment = .top
        legend.orientation = .vertical
        legend.drawInside = false
        legend.xEntrySpace = 7.0
        legend.yEntrySpace = 0.0
        legend.yOffset = 0.0
    }
    
    func updateChartData()
    {
        var colors = [UIColor]()
        colors.append(UIColor.blue)
        colors.append(UIColor.red)
        colors.append(UIColor.orange)
        colors.append(UIColor.green)
        
        var values = [PieChartDataEntry]()
        values.append(PieChartDataEntry(value: 13.5, label: "Thing 1"))
        values.append(PieChartDataEntry(value: 18.5, label: "Thing 2"))
        values.append(PieChartDataEntry(value: 48.2, label: "Thing 3"))
        values.append(PieChartDataEntry(value: 19.8, label: "Thing 4"))

        let dataset = PieChartDataSet(values: values, label: "Things of the World")
        
        dataset.colors = colors
        
        let data = PieChartData(dataSet: dataset)
        
        pieChartView.data = data
    }
    
}

