class Bike
  
  def report_broken
    @broken = true
  end

  def broken?
    if @broken
      true
    else
      false
    end
  end

end