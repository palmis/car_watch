defmodule CarWatch.Watcher do
  @moduledoc """
  GenServer worker that keeps in-memory state of seen cars.
  """
  # TODO: Add heredoc to moduledoc e.g. ##Example  
  
  use GenServer
  
  
  #########
  ## API ##
  #########
  
  @doc """
  Start the worker with an empty state
  """
  def start_link(_) do
    GenServer.start_link(__MODULE__, :ok, [])
  end
  
  @doc """
  Registers that a vehicle with `licence_plate` was observed at the given time.
  """
  def saw(licence_plate) do
    GenServer.cast(__MODULE__, {:saw, licence_plate})
  end
  
  @doc """
  Returns a report of all observed vehicles
  
  Returns `{:ok, vehicles}` where `vehicles` is a ..NA.., `:error` othervise.
  """
  def report do
    GenServer.call(__MODULE__, {:report})
  end
  
  @doc """
  Returns a report for observed vehicle with `licence_plate`
  
  Returns `{:ok, vehicle}` where `vehicle` is a ..NA.., 
  `:na` if vehicle has not been observed, `:error` othervise.
  """
  def report(licence_plate) do
    GenServer.call(__MODULE__, {:report, licence_plate})
  end
  
  #####################
  ## Server callbacks ##
  #####################
  
  
  #######################
  ## Private functions ##
  #######################
  
  
end