$ ->

  to_values_array = (values) ->
    arr = []
    console.log(typeof values)
    $.each values, (index, value) ->
      arr.push(parseFloat(value))
    arr


  $("#chart").highcharts
    title:
      text: "Daily Expense, Year 2013"
      x: -20 #center

    subtitle:
      text: "Source: Google Spreadsheet Fiscal Record"
      x: -20

    xAxis:
      categories: $("#dates").html().split(':')

    yAxis:
      title:
        text: "Expense (INR)"

      plotLines: [
        value: 0
        width: 1
        color: "#808080"
      ]

    tooltip:
      valueSuffix: "Rs"

    legend:
      layout: "vertical"
      align: "right"
      verticalAlign: "middle"
      borderWidth: 0

    series: [
      name: "Spent"
      data: to_values_array($("#values").html().split(":"))
    ]

