require 'middleman-core'
require 'middleman-slim/version'
require 'middleman-slim/template'

Middleman::Templates.register :slim, Middleman::Slim::Template
