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
  
  test "base data structure is tuple" do
    assert CarWatch.Watcher.observe("lamp") == :ok
    assert CarWatch.Watcher.observe("lamp") == :ok
    assert CarWatch.Watcher.observe("lamp") == :ok
    
    {:ok, observations} = CarWatch.Watcher.recollect("lamp")
    assert length(observations) == 3
    
    [head | tail] = observations
    assert is_list(tail)
    assert is_tuple(head)
  end
end
