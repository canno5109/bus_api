class SystemController < ApplicationController
	def index
    @version = "1.0"
    @date = DateTime.now.strftime('%Y-%m-%d %H-%M')
  end
end
