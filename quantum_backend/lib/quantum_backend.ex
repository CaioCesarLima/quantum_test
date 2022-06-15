defmodule QuantumBackend do

  alias QuantumBackend.{Plan, Music, User}

  @moduledoc """
  QuantumBackend keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  #Plan's action
  defdelegate create_plan(params), to: Plan.Create, as: :call

  #Music's action
  defdelegate create_music(params), to: Music.Create, as: :call

  #User's action
  defdelegate create_user(params), to: User.Create, as: :call
end
