class ApplicationController < ActionController::Base
    # protect_from_forgery with: :exception
    # before_action :authenticate_admin_user!
    def after_sign_out_path_for(resource)
        root_path
      end
      def authorize_user!
        authorize! :access, :admin_panel
      end
      rescue_from CanCan::AccessDenied do |exception|
        redirect_to root_path, alert: exception.message    
    #   private

    #   def authenticate_active_admin_user
    #     send(active_admin_namespace.authentication_method) if active_admin_namespace.authentication_method
    #   end
end
