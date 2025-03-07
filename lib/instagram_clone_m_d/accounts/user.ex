defmodule InstagramCloneMD.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :username, :string
    field :email, :string
    field :password_hash, :string
    field :bio, :string
    field :profile_image_url, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email, :password_hash, :bio, :profile_image_url])
    |> validate_required([:username, :email, :password_hash, :bio, :profile_image_url])
    |> unique_constraint(:email)
    |> unique_constraint(:username)
  end
end
