require 'rubygems'
require 'bundler'
require 'grape'
require_relative './application'
require 'rack/cors'

use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: [:get, :post, :put, :delete, :options]
  end
end

run Example::Application