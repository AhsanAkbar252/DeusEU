class WelcomeController < ApplicationController
	def home
		@sections = Section.all
	end
end