module UsersHelper
  def shame(user)
    if user.days_inactive > 5
      return "danger"
    elsif user.days_inactive > 2
      return "warning"
    else
      "success"
    end
  end
end
