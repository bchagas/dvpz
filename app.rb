require "bundler"
Bundler.setup(:default, ENV.fetch("RACK_ENV", :development))
Bundler.require

configure do
  Compass.configuration do |config|
    config.project_path = File.dirname(__FILE__)
    config.sass_dir = 'views'
  end

  set :haml, { :format => :html5 }
  set :sass, Compass.sass_engine_options
end

configure do
  ::I18n.locale = 'pt'
  ::I18n.load_path += Dir[File.join(File.dirname(__FILE__), 'config', 'locales', '*.yml').to_s]
end

get '/about' do
  haml :about
end

get '/gallery' do
  haml :gallery
end

helpers do
  def is_current?(path)
    'current' if path == request.path_info
  end

  def t(*args)
    I18n.t(*args)
  end
end
