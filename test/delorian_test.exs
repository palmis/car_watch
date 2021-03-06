defmodule DelorianTest do
  use ExUnit.Case
  use Timex
  
  test "travel forward 7 days" do
    now = CarWatch.Delorian.now
    CarWatch.Delorian.travel(7, :days)
    future = CarWatch.Delorian.now
    difference = Date.diff(now, future, :days)
    assert difference == 7
  end
  
  test "travel backwards 7 days" do
    now = CarWatch.Delorian.now
    CarWatch.Delorian.travel(-7, :days)
    future = CarWatch.Delorian.now
    difference = Date.diff(now, future, :days)
    assert difference == -7
  end
  
  test "travel forward 7 minutes" do
    now = CarWatch.Delorian.now
    CarWatch.Delorian.travel(7, :mins)
    future = CarWatch.Delorian.now
    difference = Date.diff(now, future, :mins)
    assert difference == 7
  end
  
  test "travel backwards 7 minutes" do
    now = CarWatch.Delorian.now
    CarWatch.Delorian.travel(-7, :mins)
    future = CarWatch.Delorian.now
    difference = Date.diff(now, future, :mins)
    assert difference == -7
  end
  
  test "travel forward 7 seconds" do
    now = CarWatch.Delorian.now
    CarWatch.Delorian.travel(7, :secs)
    future = CarWatch.Delorian.now
    difference = Date.diff(now, future, :secs)
    assert difference == 7
  end
  
  test "travel backwards 7 seconds" do
    now = CarWatch.Delorian.now
    CarWatch.Delorian.travel(-7, :secs)
    future = CarWatch.Delorian.now
    difference = Date.diff(now, future, :secs)
    assert difference == -7
  end
  
end