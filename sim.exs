defmodule Simulation do
  def naive do
    CarWatch.Watcher.observe("a")
    CarWatch.Delorian.travel(3, :mins)
    CarWatch.Watcher.observe("b")
    CarWatch.Watcher.observe("c")
    CarWatch.Watcher.observe("d")
  end
end

Simulation.naive