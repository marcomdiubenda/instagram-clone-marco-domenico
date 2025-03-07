defmodule InstagramCloneMD.Content.Like do
  use Ecto.Schema
  import Ecto.Changeset

  schema "likes" do
    belongs_to :user, InstagramCloneMD.Accounts.User
    belongs_to :post, InstagramCloneMD.Content.Post

    timestamps()
  end

  def changeset(like, attrs) do
    like
    |> cast(attrs, [:user_id, :post_id])
    |> validate_required([:user_id, :post_id])
    |> unique_constraint([:user_id, :post_id])
  end
end
