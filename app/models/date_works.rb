module DateWorks

  def year
    created_at.strftime("%Y")
  end

  def month
    created_at.strftime("%B")
  end
  
end
