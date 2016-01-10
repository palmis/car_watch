defmodule CarWatch do
  use Application
  
  def start(_type, _args) do
    IO.puts "--------------"
    IO.puts "Starting CarWatch application"
    CarWatch.Supervisor.start_link
  end
  
end
