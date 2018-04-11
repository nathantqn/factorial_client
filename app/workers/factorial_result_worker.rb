class FactorialResultWorker
    include Sneakers::Worker
    # This worker will connect to "factorial.results" queue
    # env is set to nil since by default the actuall queue name would be
    # "factorial.calculations_development"
    from_queue "factorial.results", env: nil
  
    # work method receives message payload in raw format
    # in our case it is JSON encoded string
  
    def work(raw_result)
      result_to_hash = JSON.parse raw_result
      result = result_to_hash["result"]
      puts "Received result: #{result}"
      ack! # we need to let queue know that message was received
      
    end
  end