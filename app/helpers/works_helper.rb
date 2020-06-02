module WorksHelper
  
  def zaisha(finish, start)
    finish = finish.floor_to(15.minute)
    start = start.floor_to(15.minute)
    format("%.2f", (((finish - start) / 60) / 60))
  end
  
  



end
