require 'grape-entity'
require 'pry'
require 'grape-swagger'

module Example

  class Kitty < Grape::Entity
    expose :kitty, documentation: {type: String, desc: 'The type of kitty you would like to say hello to'}
    expose :meow, documentation: {type: String, desc: 'Type of meow, not required'}
  end

  class Application < Grape::API
    version 'v1', using: :header, vendor: 'twitter'
    format :json

    resource :kitty do

      #http://localhost:9393/kitty?kitty=tabby&meow=mew
      desc 'Says hello to a kitty, kitty says hello back'
      params do
        requires :all, except: [:meow], using: Example::Kitty.documentation
      end
      get do
        kitten = {:kitty => params[:kitty], :meow => params[:meow]}
        present kitten, with: Example::Kitty
      end


      #curl -d '{"kitty": "SabreToothed", "meow":"ROAR!"}' 'http://localhost:9393/kitty' -H Content-Type:application/json -v
      desc 'Says hello to a kitty, kitty says hello back'
      params do
        # requires :body do
          requires :all, except: [:meow], using: Example::Kitty.documentation
        # end
      end
      post do
        kitten = {:kitty => params[:kitty], :meow => params[:meow]}
        present kitten, with: Example::Kitty
      end


    end
    add_swagger_documentation hide_format: true #, models: Example::Kitty
  end
end
