class UserMailer < ApplicationMailer

  def playlist_email(email, playlist_url)
    @email = email
    @playlist_url = playlist_url
    mail( :to => @email,
    :subject => 'CharacterChords: Your new Spotify Playlist' )
  end
end
