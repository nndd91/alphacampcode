class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def hello
    render html: "This is the hello from the toy app"
  end
  

end
