get '/' do
  slim :home
end

get '/step1' do
  erb :step1, :layout => false
end

get '/step2_feel' do
  erb :step2_feel, :layout => false
end

get '/step2_bad' do
  erb :step2_bad, :layout => false
end

get '/step2_not' do
  erb :step2_not, :layout => false
end

get '/submit' do
  erb :submit, :layout => false
end

get '/smile.?:format?' do
  @key = params.keys.join
  @value = params[@key]
  smile = DinosaurusMagic.new(@key, params)
  @are = smile.are
  @happy = smile.happy

  @gifs = ["/images/virtual_hug.gif", "/images/lotr.gif", "/images/friends.gif", "/images/sloth.gif", "/images/pooh.gif", "/images/minions.gif"]

  slim :smile, :layout => false
end

# SASS Compiler
get '/css/:name.css' do
  content_type 'text/css', :charset => 'utf-8'
  filename = "#{params[:name]}"
  render :scss, filename.to_sym, :layout => false, :views => './public/css'
end