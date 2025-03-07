# InstagramCloneMD

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix


## Resources

mix phx.gen.schema Accounts.User users username:string:unique email:string:unique password_hash:string bio:string profile_image_url:string
mix phx.gen.schema Accounts.Follow follows follower_id:references:users followed_id:references:users
mix phx.gen.schema Content.Post posts caption:string image_url:string user_id:references:users
mix phx.gen.schema Content.Comment comments content:string user_id:references:users post_id:references:posts
mix phx.gen.schema Content.Like likes user_id:references:users post_id:references:posts


mix phx.gen.context Accounts User users username:string:unique email:string:unique password_hash:string bio:string profile_image_url:string
mix phx.gen.context Content Post posts caption:string image_url:string user_id:references:users