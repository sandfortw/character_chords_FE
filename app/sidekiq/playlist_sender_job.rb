class PlaylistSenderJob
  include Sidekiq::Job

  def perform(email, spotify_playlist)
    require 'pry'; binding.pry
    UserNotifierMailer.playlist_email(email, spotify_playist).deliver_now
  end


end
