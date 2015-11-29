# CarWatch
Detects car licencs plates from image feed and registers information about the car.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add car_watch to your list of dependencies in `mix.exs`:

        def deps do
          [{:car_watch, "~> 0.0.1"}]
        end

  2. Ensure car_watch is started before your application:

        def application do
          [applications: [:car_watch]]
        end
