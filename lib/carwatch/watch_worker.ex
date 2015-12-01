defmodule CarWatch.WatchWorker do
  use GenServer
  
  
  #########
  ## API ##
  #########
  
  def start_link(_) do
    GenServer.start_link(__MODULE__, :ok, [])
  end
  
  #####################
  ## Event callbacks ##
  #####################
  
  
  #######################
  ## Private functions ##
  #######################
  
  
end