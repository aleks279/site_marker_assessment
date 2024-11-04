class HomePolicy
  def index?
    user.has_full_access? || user.can_edit? || user.can_view?
  end
end
