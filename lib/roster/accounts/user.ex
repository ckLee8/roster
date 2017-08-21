defmodule Roster.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Roster.Accounts.User


  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email, :name, :password])
    |> validate_required([:email, :name, :password])
    |> unique_constraint(:email)
    |> validate_format(:email, ~r/.+@.+\..+/, [message: "Please input an email"])
    |> validate_length(:password, min: 6)
  end
end
