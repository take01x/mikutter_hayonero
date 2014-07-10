# -*- coding: utf-8 -*-

Plugin.create(:mikutter_hayonero) do
  command(
          :mikutter_hayonero,
          name: 'うるさいはよねろ',
          condition: lambda{ |opt| true },
          visible: true,
          role: :timeline
          ) do |opt|
    opt.messages.map{ |m|
      user_name = m.message.user.idname
      message = "@" + user_name + " うるさいはよねろ"
      message += '　' * (rand(140-message.split(//).size+1)+1)
      Service.primary.post(:message => message,
                           :replyto => m.message)
    }
  end
end

