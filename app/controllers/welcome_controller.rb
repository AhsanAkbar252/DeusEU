class WelcomeController < ApplicationController
	def home
		@sections = Section.all
	end

	def confirm_phone
	end

	def verify_otp
	    if session[:otp] == params[:verification_code].to_i
	      current_user.update(active: true)
	      redirect_to root_path, notice: 'User signed up successfully'
	    else
	      flash.now[:notice] = 'Invalid confirmation code!'
	      render :confirm_phone
	    end
	end
end