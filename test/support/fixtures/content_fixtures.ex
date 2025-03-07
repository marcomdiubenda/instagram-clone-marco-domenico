defmodule InstagramCloneMD.ContentFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `InstagramCloneMD.Content` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        caption: "some caption",
        image_url: "some image_url"
      })
      |> InstagramCloneMD.Content.create_post()

    post
  end
end
