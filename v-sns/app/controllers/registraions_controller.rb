class RegistraionsController < Devise::RegistrationsController
	protected

	def after_inactive_sign_up_path_for(resource)
    'user_confirmable_path'
  end
end
