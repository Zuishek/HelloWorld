class SessionsController < Devise::SessionsController
	def new
		super
	end

	protected

		def after_sign_in_path_for(resource)
			if resource.is_a?(User) && resource.banned?
				sign_out resource
				flash[:alert] = 'This account has been suspended for violations...'
				root_path
			else
				super
			end
		end
end
