class LightsController < ApplicationController
  # before_action :checkStatus, :except => [:modes]
  $counter = 0
  def index

  end

  def checkStatus
    $counter += 1
    puts $counter
    if File.exists?('/sys/class/gpio/gpio4')
      @status = `cat /sys/class/gpio/gpio4/value`
      render :json => @status
    else
      puts "does not exist"
    end
  end

  def modes
    begin
      command = params[:data]
      if command == 'on'
        `sudo sh -c "echo 0 > /sys/class/gpio/gpio4/value"`
      elsif command == 'off'
        `sudo sh -c "echo 1 > /sys/class/gpio/gpio4/value"`
      end
    end
  end




  # def initPins
  #   puts "init has been called"
  #   require 'rpi_gpio'
  #   @pin = RPi::GPIO
  #   @pin.set_numbering :bcm
  #   @pin.setup 4, :as => :output
  # end

  # def pinMode
  #   begin
  #     puts "function called"
  #     # puts @pin.high?
  #     command = params[:data]
  #     # puts "this is data: => #{command}"
  #     # #
  #     # if command == 'on'
  #     #   puts "this the command was set ON"
  #     #   puts "the command is #{command}"
  #     # elsif command == 'off'
  #     #   puts "this is the command was set OFF"
  #     #   puts "the comamnd is #{command}"
  #     # end
  #
  #     if command == "on"
  #       pin.set_low
  #     elsif command == "off"
  #       pin.set_high
  #     end
  #
  #   rescue => e
  #     puts e
  #
  #   ensure
  #     @pin.reset
  #   end
  # end
end
