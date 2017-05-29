  def eligible_arr(arr)
    return false if arr == nil
    return false if arr.empty?
    return false if arr < 2
    return true
  end

  p eligible_arr("")
  p eligible_arr(nil)
