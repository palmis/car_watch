defmodule CarWatchTest do
  use ExUnit.Case
  #doctest CarWatch
  
  test "observe merci" do
    assert CarWatch.Watcher.observe("merci") == :ok
  end
  
  test "recollect onion" do
    assert CarWatch.Watcher.recollect("onion") == :error
    
    assert CarWatch.Watcher.observe("onion") == :ok
    {:ok, observations} = CarWatch.Watcher.recollect("onion")
    assert length(observations) == 1
    
    assert CarWatch.Watcher.observe("onion") == :ok    
    {:ok, observations} = CarWatch.Watcher.recollect("onion")
    assert length(observations) == 2
  end
end
