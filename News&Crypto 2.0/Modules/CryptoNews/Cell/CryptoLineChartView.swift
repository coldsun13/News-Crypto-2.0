import UIKit
import Charts

//protocol ChartViewModel {
//    var data: [Double] { get }
//    var showLegend: Bool { get }
//    var showAxis: Bool { get }
//    var fillColor: UIColor { get }
//}

final class CryptoLineChartView: UIView {
    
    private let chartView = LineChartView()
    
    struct ChartViewModel {
        var data: [Double]
        var showLegend: Bool
        var showAxis: Bool
        var fillColor: UIColor
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        addSetups()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        chartView.frame = bounds
    }
    
    // MARK: - API
    func configure(viewModel: ChartViewModel) {
        var entries = [ChartDataEntry]()
        for (index, value) in viewModel.data.enumerated() {
            entries.append(.init(x: Double(index), y: value))
        }
        
        chartView.rightAxis.enabled = viewModel.showAxis
        chartView.legend.enabled = viewModel.showLegend
        
        let dataSet = LineChartDataSet(entries: entries, label: "7 Days")
        
        dataSet.drawFilledEnabled = true
        dataSet.drawIconsEnabled = false
        dataSet.drawValuesEnabled = false
        dataSet.drawCirclesEnabled = false
        dataSet.setColor(viewModel.fillColor)
        
        let gradientColors = [viewModel.fillColor.cgColor, UIColor.clear.cgColor] as CFArray
        let colorLocations:[CGFloat] = [0.8, 0.0]
        let gradient = CGGradient.init(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: gradientColors, locations: colorLocations)
        dataSet.fill = LinearGradientFill(gradient: gradient! , angle: 90.0)
        dataSet.drawFilledEnabled = true
        let data = LineChartData(dataSet: dataSet)
        chartView.data = data
    }
}

private extension CryptoLineChartView {
    
    func addSubviews() {
        addSubview(chartView)
    }
    
    func addSetups() {
        chartView.setScaleEnabled(true)
        chartView.xAxis.enabled = false
        chartView.leftAxis.enabled = false
        chartView.rightAxis.enabled = false
        chartView.drawGridBackgroundEnabled = false
        chartView.pinchZoomEnabled = false
        chartView.legend.enabled = false
    }
}
