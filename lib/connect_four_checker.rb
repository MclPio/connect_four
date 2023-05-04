module ConnectFourChecker
  def last_row(last_entry)
    last_entry.split(' ').map{ |item| item.to_i}[0]
  end

  def last_column(last_entry)
    last_entry.split(' ').map{ |item| item.to_i}[1]
  end

  def check_horizontal
    true
  end
end