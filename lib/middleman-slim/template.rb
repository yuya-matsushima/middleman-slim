require 'middleman-core/templates'

module Middleman
  module Slim

    class Template < Middleman::Templates::Base
      class_option 'css_dir',
        default: 'stylesheets',
        desc: 'The path to the css files'
      class_option 'js_dir',
        default: 'javascripts',
        desc: 'The path to the javascript files'
      class_option 'images_dir',
        default: 'images',
        desc: 'The path to the image files'

      def self.source_root
        File.join(File.dirname(__FILE__), 'template')
      end

      def build_scaffold
        template 'shared/Gemfile.tt', File.join(location, 'Gemfile')
        template 'shared/config.tt', File.join(location, 'config.rb')
        copy_file 'source/index.html.slim', File.join(location, 'source/index.html.slim')
        copy_file 'source/layouts/layout.slim', File.join(location, 'source/layouts/layout.slim')

        empty_directory File.join(location, 'source', options[:css_dir])
        copy_file 'source/stylesheets/all.css', File.join(location, 'source', options[:css_dir], 'all.css')
        copy_file 'source/stylesheets/normalize.css', File.join(location, 'source', options[:css_dir], 'normalize.css')

        empty_directory File.join(location, 'source', options[:js_dir])
        copy_file 'source/javascripts/all.js', File.join(location, 'source', options[:js_dir], 'all.js')

        empty_directory File.join(location, 'source', options[:images_dir])
        copy_file 'source/images/background.png', File.join(location, 'source', options[:images_dir], 'background.png')
        copy_file 'source/images/middleman.png', File.join(location, 'source', options[:images_dir], 'middleman.png')
        replace_css_img_dir
      end

      private
      def replace_css_img_dir
        f = File.open(File.join(location, 'source', options[:css_dir], 'all.css'), 'r')
        buf = f.read
        buf.gsub!(/IMG_DIR/, options[:images_dir])
        f.close

        f = File.open(File.join(location, 'source', options[:css_dir], 'all.css'), 'w')
        f.write(buf)
        f.close
      end
    end
  end
end

Middleman::Templates.register :slim, Middleman::Slim::Template
