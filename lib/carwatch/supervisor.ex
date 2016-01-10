defmodule CarWatch.Supervisor do
  use Supervisor
  
  def start_link do
    Supervisor.start_link(__MODULE__, :ok)
  end
  
  def init(:ok) do
    children = [
      worker(CarWatch.Watcher, []),
      worker(CarWatch.Delorian, [])
    ]
    
    opts = [strategy: :one_for_all]

    supervise(children, opts)
  end
end