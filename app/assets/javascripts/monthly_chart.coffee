$ ->
  to_values_array = (values) ->
    arr = []
    $.each values, (index, value) ->
      arr.push(parseInt(value))
    arr

  $("#monthly .chart").highcharts
    chart:
      type: "column"

    title:
      text: "Monthly Expense"

    subtitle:
      text: "Source: Google Spreadsheet Fiscal Record"

    xAxis:
      categories: $("#monthly .months").html().split(":")

    yAxis:
      min: 0
      title:
        text: "Expense (INR)"

    tooltip:
      headerFormat: "<span style=\"font-size:10px\">{point.key}</span><table>"
      pointFormat: "<tr><td style=\"color:{series.color};padding:0\">{series.name}: </td>" + "<td style=\"padding:0\"><b>{point.y:.1f} Rs</b></td></tr>"
      footerFormat: "</table>"
      shared: true
      useHTML: true

    plotOptions:
      column:
        pointPadding: 0.2
        borderWidth: 0

    series: [
      name: "Expense"
      data: to_values_array($("#monthly .values").html().split(":"))
    ]