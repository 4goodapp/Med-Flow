module UserHelper
	def current_user
    if @user.nil? && session[:user_id]
		  @user = User.find(session[:user_id])
    end
    @user
	end

  def user
    @user ||= User.find(session[:user_id])
    Rails.cache
  end
end
