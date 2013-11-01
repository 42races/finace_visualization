class SheetParser
  def initialize
    @record = Roo::Google.new($KEY, user: $USER, password: $PASSWORD)
  end
end