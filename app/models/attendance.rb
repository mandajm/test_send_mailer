class Attendance < ApplicationRecord
    after_create :attendance_send

    def attendance_send
        UserMailer.attendance_email(self).deliver_now
    end
end
