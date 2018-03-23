class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  def record_not_found
    respond_to do |type|
      type.all  { render :nothing => true, :status => 404 }
    end
  end

end
