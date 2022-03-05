module ControlHelper

  def worked_hours(points)
    points.in_groups_of(2,false).map do |group_of_points|
      ((group_of_points.last.created_at - group_of_points.first.created_at) / 1.minutes).round
    end.sum
  end
end
