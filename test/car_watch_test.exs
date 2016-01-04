defmodule CarWatchTest do
  use ExUnit.Case
  #doctest CarWatch
  
  setup do
    {:ok, watcher} = CarWatch.Watcher.start_link([])
    {:ok, watcher: watcher}
  end
  
  test "observe merci", %{watcher: watcher} do
    assert CarWatch.Watcher.observe(watcher, "merci") == :ok
  end
  
  test "recollect onion", %{watcher: watcher} do
    assert CarWatch.Watcher.recollect(watcher, "onion") == :error
    
    assert CarWatch.Watcher.observe(watcher, "onion") == :ok
    {:ok, observations} = CarWatch.Watcher.recollect(watcher, "onion")
    assert  length(observations) == 1
    
    assert CarWatch.Watcher.observe(watcher, "onion") == :ok    
    {:ok, observations} = CarWatch.Watcher.recollect(watcher, "onion")
    assert  length(observations) == 2
  end
end
