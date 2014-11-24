require 'rubygems'
require 'bundler'
require 'grape'
require_relative './application'
require 'rack/cors'

run Example::Application