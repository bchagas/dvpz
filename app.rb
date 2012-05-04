require "bundler"
Bundler.setup(:default, ENV.fetch("RACK_ENV", :development))
Bundler.require

get '/:file.css' do
  sass :"#{params[:file]}"
end

get '/' do
  haml :index
end
