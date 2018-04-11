class FactorialController < ApplicationController
    def hello
       @u = 0 
    end

    def calculate
        
        Publisher.publish("send_number", {number: params[:input][:number]})
        
        render 'hello'
    end

end
