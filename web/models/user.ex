defmodule Discuss.User do
  use Discuss.Web, :model

  @derive {Poison.Encoder, only: [:username, :email]}
  schema "users" do
    field :email, :string
    field :username, :string
    field :provider, :string
    field :token, :string
    has_many :topics, Discuss.Topic
    has_many :comments, Discuss.Comment

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :username, :provider, :token])
    |> validate_required([:email, :username, :provider, :token])
  end
end
