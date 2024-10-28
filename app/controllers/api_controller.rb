class ApiController < ApplicationController
    before_action :render_root_unless_json

    private

    def render_root_unless_json
        return render 'home/index' unless request.format.json?
    end
end