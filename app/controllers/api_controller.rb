class ApiController < ApplicationController
    before_action :render_root_unless_json

    private

    def render_root_unless_json
        puts "REQUEST FORMAT #{request.format.json?}"
        return render 'home/index' unless request.format.json?
    end
end