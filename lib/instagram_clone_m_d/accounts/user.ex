defmodule InstagramCloneMD.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :username, :string
    field :email, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    field :bio, :string
    field :profile_image_url, :string

    has_many :posts, InstagramCloneMD.Content.Post
    has_many :comments, InstagramCloneMD.Content.Comment
    has_many :likes, InstagramCloneMD.Content.Like

    many_to_many :followers, InstagramCloneMD.Accounts.User,
      join_through: InstagramCloneMD.Accounts.Follow,
      join_keys: [followed_id: :id, follower_id: :id]

    many_to_many :following, InstagramCloneMD.Accounts.User,
      join_through: InstagramCloneMD.Accounts.Follow,
      join_keys: [follower_id: :id, followed_id: :id]

    timestamps()
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email, :password, :bio, :profile_image_url])
    |> validate_required([:username, :email, :password])
    |> validate_length(:username, min: 3, max: 30)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:username)
    |> unique_constraint(:email)
    |> put_password_hash()
  end

  defp put_password_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    # In a real app, use a proper hashing library like Argon2, Bcrypt, etc.
    # This is just a placeholder
    put_change(changeset, :password_hash, "hashed_#{password}")
  end

  defp put_password_hash(changeset), do: changeset
end
