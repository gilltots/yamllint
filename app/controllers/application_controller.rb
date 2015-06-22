class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  require 'ya2yaml'
  
  def new
  end

  def create
    @yaml = params[:yaml] || ""
    begin
      @yaml = YAML.load(@yaml)
      @yaml = @yaml.ya2yaml(:syck_compatible => true)
    rescue ArgumentError => ex
      @error = ex.message
      if @error =~ /line ([\d]+)/i
        @error_line = $1
      end
    end
    render :new
  end

end
