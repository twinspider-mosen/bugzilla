class HelloJob
  include Sidekiq::Job

  def perform(*args)
    # Do something
    puts "Hello this is Sidekiq Job "
  end
end
