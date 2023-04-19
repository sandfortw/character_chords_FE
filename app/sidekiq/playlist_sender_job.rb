class PlaylistSenderJob
  include Sidekiq::Job

  def perform(email, spotify_playlist)
    UserMailer.playlist_email(email, spotify_playlist).deliver_now
  end
end
