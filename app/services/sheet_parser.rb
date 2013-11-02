class SheetParser

  attr_accessor :record

  def initialize(user)
    @record = Roo::Google.new($KEY, access_token: user.auth_token)
  end

  def parse
    # daily = {
    #   Date.parse("22/10/2013") => 199.0,
    #   Date.parse("23/10/2013") => 128.0,
    #   Date.parse("24/10/2013") => 133.0,
    #   Date.parse("25/10/2013") => 80.0,
    #   Date.parse("26/10/2013") => 30.0,
    #   Date.parse("27/10/2013") => 197.0,
    #   Date.parse("22/11/2013") => 199.0,
    #   Date.parse("23/11/2013") => 128.0,
    #   Date.parse("24/11/2013") => 133.0,
    #   Date.parse("25/11/2013") => 80.0,
    #   Date.parse("26/11/2013") => 30.0,
    #   Date.parse("27/11/2013") => 197.0
    # }


    first = 2
    last  = @record.last_row

    daily = {}

    (first..last).each do |i|
      daily[@record.cell('A', i)] = @record.cell('B', i)
    end

    monthly = {}

    daily.each do |key, value|
      k = key.strftime("%m/%Y")
      monthly[k] = 0 unless monthly.has_key?(k)
      monthly[k] += value
    end

    { daily: daily, monthly: monthly }
  end

  def personal_info
    # data = {"Jithesh"=>{"10/2013"=>45},
    # "Sumesh"=>{"10/2013"=>400},
    # "Shibu"=>{"10/2013"=>288},
    # "Shijo"=>{"10/2013"=>100},
    # "Pradeep"=>{"10/2013"=>100},
    # "Deepak"=>{"10/2013"=>497}}


    @record.default_sheet = @record.sheets[1]
    first = 2
    last  = @record.last_row
    column_range = 'B'..'G'
    names = column_range.collect { |r| @record.cell(r, 1) }
    data = {}

    column_range.each_with_index do |r, index|
      h = {}
      (first..last).each do |i|
        k = @record.cell('A', i).strftime("%m/%Y")
        h[k] = 0 unless h.has_key?(k)
        s = @record.cell(r, i).to_i
        h[k] += s
      end
      data[names[index]] = h
    end

    dates = []
    series = []
    data.keys.each do |name|
      h = {}
      h[:name] = name
      h[:data] = []
      data[name].each do |k,v|
        dates << k unless dates.include? k
        h[:data] << v
      end

      series << h
    end

    { dates: dates, series: series }
  end
end