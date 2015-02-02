defmodule Jotto.Word do
  use Ecto.Model

  schema "words" do
    field :word, :string
    field :secret, :boolean, default: false
    timestamps
  end
end
