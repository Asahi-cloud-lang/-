module AttendancesHelper

  def attendance_state(attendance)
    # 受け取ったAttendanceオブジェクトが当日と一致するか評価します。
    if Date.current == attendance.worked_on
      return '出社' if attendance.started_at.nil?
      return '退社' if attendance.started_at.present? && attendance.finished_at.nil?
    end
    # どれにも当てはまらなかった場合はfalseを返します。
    return false
  end
  
  # 出勤時間と退勤時間を受け取り、切りのいい時間に修正して返します。
  def working_time_format(time)
    if time.to_i < 15
      time = "00"
    elsif time.to_i < 30
      time = 15
    elsif time.to_i < 45
      time = 30
    elsif time.to_i < 60
      time = 45
    end
  end      

  # 出勤時間と退勤時間を受け取り、在社時間を計算して返します。
  def working_times(start, finish)
    format("%.2f", ((finish - start)/60)/60 )
  end
end