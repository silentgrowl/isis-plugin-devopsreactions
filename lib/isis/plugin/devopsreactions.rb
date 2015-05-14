require "nokogiri"

module Isis
  module Plugin
    class DevopsReactions < Isis::Plugin::Base
      TRIGGERS = %w(!devops !devopsreactions)

      def respond_to_msg?(msg, speaker)
        TRIGGERS.include? msg.downcase
      end

      private

      def response_text
        page = Nokogiri.HTML(open('http://devopsreactions.tumblr.com/random'))
        title = page.css('.post_title a').text
        img = page.css('.item_content p img').attr('src').value
        "#{title}\n#{img}"
      end
    end
  end
end
