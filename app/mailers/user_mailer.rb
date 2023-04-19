class UserMailer < ApplicationMailer
  default from: 'characterchords@gmail.com'

  def playlist_email(email, playlist)
    @email = email
    @mood = playlist
    mail( :to => @email,
    :subject => 'Open this message for the mood of the day.' )
  end
end
end
