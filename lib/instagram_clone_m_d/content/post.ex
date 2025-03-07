defmodule InstagramCloneMD.Content.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :caption, :string
    field :image_url, :string

    belongs_to :user, InstagramCloneMD.Accounts.User
    has_many :comments, InstagramCloneMD.Content.Comment
    has_many :likes, InstagramCloneMD.Content.Like

    timestamps()
  end

  def changeset(post, attrs) do
    post
    |> cast(attrs, [:caption, :image_url, :user_id])
    |> validate_required([:image_url, :user_id])
  end
end
