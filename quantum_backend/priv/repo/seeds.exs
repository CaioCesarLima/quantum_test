# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     QuantumBackend.Repo.insert!(%QuantumBackend.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.


{:ok, gold} = QuantumBackend.create_plan(%{name: "Gold", level: 2, limit: 5})
{:ok, basic} = QuantumBackend.create_plan(%{name: "Basic", level: 1, limit: 3})

QuantumBackend.create_music(%{name: "Orient", plan_id: basic.id})
QuantumBackend.create_music(%{name: "Chiptune", plan_id: gold.id})
QuantumBackend.create_music(%{name: "EDM", plan_id: basic.id})
QuantumBackend.create_music(%{name: "Chillout", plan_id: gold.id})
QuantumBackend.create_music(%{name: "Dubstep", plan_id: gold.id})
QuantumBackend.create_music(%{name: "Winter", plan_id: basic.id})
QuantumBackend.create_music(%{name: "Summer", plan_id: basic.id})
QuantumBackend.create_music(%{name: "Ocariana", plan_id: gold.id})

QuantumBackend.create_user(%{name: "Caio", plan_id: gold.id, password_hash: "123456", email: "caio@gmail.com"})
