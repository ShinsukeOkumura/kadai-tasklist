module SessionsHelper
	def current_user
		p User.find_by(id: session[:user_id])
		# @current_userがnilの場合にUser.find_by()を@current_userに代入
		# @current_user = @current_user || User.find_by(id: session[:user_id])
		@current_user ||= User.find_by(id: session[:user_id])
	end
	
	def logged_in?
		!!current_user
		# false
	end
end
