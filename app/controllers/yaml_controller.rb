class YamlController < ApplicationController
require 'ya2yaml'

  def parse
    @yaml = params[:yaml] || ""
    if request.post?
      begin
        @yaml = YAML.load(@yaml)
        @yaml = @yaml.ya2yaml(:syck_compatible => true)
      rescue ArgumentError => ex
        @error = ex.message
        if @error =~ /line ([\d]+)/i
          @error_line = $1
        end
      end
    end
  end

end
