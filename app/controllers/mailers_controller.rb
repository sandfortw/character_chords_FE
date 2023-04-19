class MailersController < ApplicationController
  def create
    MoodSenderJob.perform_async(current_user.email, current__spotify_playlist)
    flash[:message] = "You did it! Email sent to #{params[:mailers][:email]}"
    redirect_to "/sent"
  end

  def sent
  end
end