module UsersHelper
  def shame(user)
    if user.updated_at < DateTime.now-3.days
      return "danger"
    elsif user.updated_at < DateTime.now-2.days
      return "warning"
    else
      "success"
    end
  end
end
