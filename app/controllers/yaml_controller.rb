class YamlController < ApplicationController

  def parse
    @yaml = params[:yaml] || ""
    if request.post?
      begin
        @yaml = YAML.load(@yaml)
        @yaml = YAML.dump(@yaml)
      rescue ArgumentError => ex
        @error = ex.message
        if @error =~ /line ([\d]+)/i
          @error_line = $1
        end
      end
    end
  end

end
