member = User.create(username: "Member",
                    email: FFaker::Internet.email,
                    password: '123456',
                    password_confirmation: '123456')
member.add_role :member                    
admin = User.create(username: "Admin",
                    email: FFaker::Internet.email,
                    password: '123456',
                    password_confirmation: '123456')
admin.add_role :admin

members = []
members << member

(1..19).each do |n|
    new_member = User.create(username: "Member ##{n}",
                             email: FFaker::Internet.email,
                             password: '123456',
                             password_confirmation: '123456')
end

members.each do |member|
    attendances = []
    25.times do 
        attendances << Attendance.new(date: Date.today - rand(100),
                                      user_id: member.id)
    end
    sorted_attendances = attendances.sort_by { |attendance| attendance.date }
    sorted_attendances.each do |attendance|
        attendance.save
    end
end
