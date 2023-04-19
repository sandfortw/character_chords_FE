class UserMailer < ApplicationMailer

  def playlist_email(email, playlist)
    @email = email
    @playlist = playlist
    mail( :to => @email,
    :subject => 'TESTING SIDEKIQ' )
  end
end
