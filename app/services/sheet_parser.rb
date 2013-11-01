class SheetParser

  attr_accessor :record

  def initialize(user)
    # @record = Roo::Google.new($KEY, user: $USER, password: $PASSWORD)
    @record = Roo::Google.new($KEY, access_token: user.auth_token)
  end

  def parse
    # data = {
    #   "10/22/2013"=>199.0,
    #   "10/23/2013"=>128.0,
    #   "10/24/2013"=>133.0,
    #   "10/25/2013"=>80.0,
    #   "10/26/2013"=>30.0,
    #   "10/27/2013"=>197.0
    # }

    # data

    first = 2
    last  = @record.last_row

    data_hash = {}

    (first..last).each do |i|
      data_hash[@record.cell('A', i)] = @record.cell('B', i)
    end

    data_hash
  end
end