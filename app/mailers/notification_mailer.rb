class NotificationMailer < ApplicationMailer
    # default from: 'shirata.motoki@lmi.ne.jp'

    # def delay_notification
    #     time=Time.now
    #     bosses=Boss.all
    #     bosses.each do |@boss|
    #         @delay_pts = []
    #         teams=@boss.teams
    #         teams.each do |@team|
    #             @team.users.each do |@user|
    #                 @user.parent_tasks.each do |@pt|
    #                     # binding.pry
    #                     @pt.child_tasks.each do |@ct|
    #                         # @delay_ct = []
    #                         if @pt.parent_deadline > time && @ct.done == 2 && @ct.possibility == 2
    #                             @delay_pts.push(@pt)
    #                             next
    #                             # @delay_ct.push(@ct)
    #                         end
    #                     end
    #                 end
    #             end
    #         end
    #     end
    # end

    def test(email)
        mail(to: email) do |format|
            format.html
        end
    end


end
