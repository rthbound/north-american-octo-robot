class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :freshy_freshy

  def freshy_freshy
    pre  = File.read("app/assets/stylesheets/_pre.css.scss")
    var  = Tilt::ERBTemplate.new("app/assets/stylesheets/var.css.scss.erb").render(Object.new, { request: request })
    post = File.read("app/assets/stylesheets/_post.css.scss")
    @css = Sass::Engine.new(pre + var + post, syntax: :scss).render
  end
end
