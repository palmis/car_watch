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
  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end
  
  @doc """
  Registers that a vehicle with `licence_plate` was observed at the given time.
  """
  def observe(watcher, licence_plate) do
    GenServer.cast(watcher, {:observe, licence_plate})
  end
  
  @doc """
  Returns a report of all observed vehicles
  
  Returns `{:ok, vehicles}` where `vehicles` is a ..NA.., `:error` othervise.
  """
  def recollect(watcher) do
    GenServer.call(watcher, :recollect)
  end
  
  @doc """
  Returns a report for observed vehicle with `licence_plate`
  
  Returns `{:ok, vehicle}` where `vehicle` is a ..NA.., 
  `:na` if vehicle has not been observed, `:error` othervise.
  """
  def recollect(watcher, licence_plate) do
    GenServer.call(watcher, {:recollect, licence_plate})
  end
  
  ######################
  ## Server callbacks ##
  ######################
  
  def init(:ok) do
    {:ok, %{}}
  end
  
  def handle_cast( {:observe, licence_plate}, state ) do
    if Map.has_key?(state, licence_plate) do
      {:ok, observations} = Map.fetch(state, licence_plate)
      new_observations = [observations | observation(licence_plate)]
      {:noreply, Map.put(state, licence_plate, new_observations)}
    else
      new_observations = [observation(licence_plate)]
      {:noreply, Map.put(state, licence_plate, new_observations)}
    end
  end
  
  def handle_call( :recollect, _from, state ) do
    reply = state
    {:reply, reply, state}
  end
  
  def handle_call( {:recollect, licence_plate}, _from, state ) do
    reply = Map.fetch(state, licence_plate)
    {:reply, reply, state}
  end
  
  #######################
  ## Private functions ##
  #######################
  
  defp observation(licence_plate) do
    {licence_plate, "date x"}
  end
  
end