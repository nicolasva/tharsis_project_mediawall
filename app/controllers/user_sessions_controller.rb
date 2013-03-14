class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])

      if @user_session.save
       flash[:notice] = t("controller.notice.usersessions.positif")
	redirect_to(presentations_url)
      else
        render :action => "new"
      end
  end

  def langue
		langue = Langue.new
		langue.langue = params[:id]
		session['langue'] = langue
		redirect_to(:back)
  end

  def destroy
    @user_session = UserSession.find
    @user_session.destroy
	
    flash[:notice] = t("controller.notice.usersessions.negatif")
    redirect_to root_url
  end
end
