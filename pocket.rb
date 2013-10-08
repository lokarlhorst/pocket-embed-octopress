require 'rubygems'
require 'pocket'


module Jekyll
  class PocketLinks < Liquid::Tag

    def initialize(name, id, tokens)
      super
      @id = id.strip

      ## Pocket Configuration
      consumer_key = 'yourconsumerkey'
      access_token = 'youraccesstoken'

      Pocket.configure do |config|
        config.consumer_key = consumer_key
      end

      client = Pocket.client(:access_token => access_token)
      info = client.retrieve :detailType => :article

      @title = info["list"][@id]["resolved_title"]
      @excerpt = info["list"][@id]["excerpt"]
      @resolved_url = info["list"][@id]["resolved_url"]
    end

    def render(context)
      %(<div style="border: 1px solid #b4b4b4; padding: 10px; background-color: white; border-radius: 10px;
          -moz-border-radius: 10px;
          -webkit-border-radius: 10px;
          -webkit-box-shadow:0 1px 4px rgba(0, 0, 0, 0.3), 0 0 40px rgba(0, 0, 0, 0.1) inset;
          -moz-box-shadow:0 1px 4px rgba(0, 0, 0, 0.3), 0 0 40px rgba(0, 0, 0, 0.1) inset;
          box-shadow:0 1px 4px rgba(0, 0, 0, 0.3), 0 0 40px rgba(0, 0, 0, 0.1) inset;"><div style="padding: 5px; float: left;"><img src="/images/pocket_small.png" style="max-width: 60px; height: auto; align=center;" /><a href="https://getpocket.com/save" class="pocket-btn" data-lang="en" style="float: left;"
            data-save-url="#{@resolved_url}"
            data-pocket-count="vertical" 
            data-pocket-align="right"
            ></a><script type="text/javascript">!function(d,i){if(!d.getElementById(i)){var j=d.createElement("script");j.id=i;j.src="https://widgets.getpocket.com/v1/j/btn.js?v=1";var w=d.getElementById(i);d.body.appendChild(j);}}(document,"pocket-btn-js");</script>
            </div><div style="margin-left: 70px;"><h3>#{@title}</h3></div><div style="margin-left: 70px;"><p>#{@excerpt}</p><p><a href="#{@resolved_url}">#{@resolved_url}</a></p></div></div>)
    end
  end
end

Liquid::Template.register_tag('pocket', Jekyll::PocketLinks)

