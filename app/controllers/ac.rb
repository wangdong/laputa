Laputa::App.controllers :ac do
  # get :index, :map => '/foo/bar' do
  #   session[:foo] = 'bar'
  #   render 'index'
  # end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   'Maps to url '/foo/#{params[:id]}''
  # end

  get '/:sampling/:node' do
    
    ac = Ac.new
    ac.node = params[:node]
    ac.temp = params[:temp]
    ac.hum = params[:hum]
    ac.save

    "OK"

  end
  

end
