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