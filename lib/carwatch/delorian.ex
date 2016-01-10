defmodule CarWatch.Delorian do
  @moduledoc """
  Timetravling data time provider.
  Used by other modules in the system to enable simulated testing.
  """
  # TODO: Add heredoc to moduledoc e.g. ##Example
  
  use GenServer
  use Timex
  
  #########
  ## API ##
  #########
  
  @doc """
  Start the Delorian in pressent time.
  The module is started with a state 0 for time offset.
  """
  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, :ok, opts ++ [name: __MODULE__])
  end
  
  @doc """
  Get the Delorian's current date 
  """
  def now do
    GenServer.call(__MODULE__, :now)
  end
  
  @doc """
  Time travel x days
  """
  def travel(:days, days) do
    GenServer.cast(__MODULE__, {:days, days})
  end
  
  @doc """
  Time travel x minutes
  """
  def travel(:mins, mins) do
    GenServer.cast(__MODULE__, {:mins, mins})
  end
  
  @doc """
  Time travel x seconds
  """
  def travel(:secs, secs) do
    GenServer.cast(__MODULE__, {:secs, secs})
  end
  
  ######################
  ## Server callbacks ##
  ######################
  
  def init(:ok) do
    {:ok, 0}
  end
  
  def handle_call(:now, _from, state) do
    {:reply, _now(state), state}
  end
  
  def handle_cast({:days, days}, state) do
    {:ok, new_state} = _travel(state, days, :days)
    {:noreply, new_state}
  end
  
  def handle_cast({:mins, mins}, state) do
    {:ok, new_state} = _travel(state, mins, :mins)
    {:noreply, new_state}
  end
  
  def handle_cast({:secs, secs}, state) do
    {:ok, new_state} = _travel(state, secs, :secs)
    {:noreply, new_state}
  end
  
  #######################
  ## Private functions ##
  #######################
  
  defp _now(offset) do
    Date.now
    |> Date.shift(secs: offset)
  end
  
  defp _travel(state, interval, unit) when is_atom(unit) do
    now = _now(state)
    destination = now |> _shift(interval, unit)
    state_iteration = Date.diff(now, destination, :secs)
    {:ok, state + state_iteration}
  end
  
  defp _shift(date, interval, :days) do
    Date.shift(date, days: interval)
  end
  
  defp _shift(date, interval, :mins) do
    Date.shift(date, mins: interval)
  end
  
  defp _shift(date, interval, :secs) do
    Date.shift(date, secs: interval)
  end
  
end