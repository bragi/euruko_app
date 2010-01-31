# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include AuthenticatedSystem

  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password

  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  protected

    def record_not_found
      render :file => "#{RAILS_ROOT}/public/404.html", :status => 404
    end
    
  private

    def load_paper_by_paper_id
      @paper = Paper.find( params[:paper_id] )
    end
    
    def load_paper_by_id
      @paper = Paper.find( params[:id] )
    end
    
    def admin_required
      if( !admin? )
        record_not_found
      end
    end
    
    def speaker_or_admin_required
      if( !current_user.is_speaker_on_or_admin?( @paper ) )
        record_not_found
      end
    end
      
    def current_cart
      if session[:cart_id]
        @current_cart ||= Cart.find(session[:cart_id])
        session[:cart_id] = nil  if @current_cart.status != Cart::STATUS[:ON_SESSION]
        session[:cart_id] = nil  if @current_cart.user != current_user
      end
      if session[:cart_id].nil?
        @current_cart = Cart.retrieve_on_sesion_or_new( current_user.id )
        session[:cart_id] = @current_cart.id
      end
      
      @current_cart
    end
    

end
