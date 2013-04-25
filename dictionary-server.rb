require "sinatra"
require "haml"
require "json"
require "rabl"

def random_word
  path = "/usr/share/dict/words"
  File.readlines(path).sample.chomp
end

def opts
  {
    :locals => {
      :word => random_word
    }
  }
end

get "/words" do
  haml :index, opts
end

# RABL JSON API
get "/words.json" do
  rabl :index, opts
end

# Simple JSON API
# get "/words.json" do
#   {word: random_word}.to_json
#   # outputs: "{\"word\":\"#{random_word}\"}"
# end
