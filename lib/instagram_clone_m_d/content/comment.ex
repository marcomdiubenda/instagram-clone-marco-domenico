defmodule InstagramCloneMD.Content.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "comments" do
    field :content, :string

    belongs_to :user, InstagramCloneMD.Accounts.User
    belongs_to :post, InstagramCloneMD.Content.Post

    timestamps()
  end

  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:content, :user_id, :post_id])
    |> validate_required([:content, :user_id, :post_id])
  end
end
