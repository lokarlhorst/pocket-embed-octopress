require 'rubygems'
require 'pocket'
require 'json'


module Jekyll
  class PocketLinks < Liquid::Tag

    def initialize(name, id, tokens)
      super
      @id = id.strip

      @cachefolder = File.expand_path "../.pocketcache", File.dirname(__FILE__)
      FileUtils.mkdir_p @cachefolder

      if File.exist? get_cached_file(@id)
        get_cached_data(@id)
      else
        get_data_from_pocket(@id)
      end

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

    def get_data_from_pocket(pocket_id)
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

      string = {:title => @title, :excerpt => @excerpt, :resolved_url => @resolved_url}
      cached_file = get_cached_file(pocket_id)

      File.open(cached_file, "w") do |file|
        file.write string.to_json
      end
    end

    def get_cached_data(pocket_id)
      cached_file = get_cached_file(pocket_id)
      info = JSON.parse File.read cached_file if File.exist? cached_file
      return nil if info.nil?
      @title = info["title"]
      @excerpt = info["excerpt"]
      @resolved_url = info["resolved_url"]
    end

    def get_cached_file(pocket_id)
      File.join @cachefolder, "#{pocket_id}.cache"
    end

  end
end

Liquid::Template.register_tag('pocket', Jekyll::PocketLinks)

