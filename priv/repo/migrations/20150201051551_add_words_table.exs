defmodule Jotto.Repo.Migrations.AddGuessWordsTable do
  use Ecto.Migration

  def up do
    create table(:words) do
      add :word, :string
      add :secret, :boolean, default: false
      timestamps
    end

    create index(:words, [:word], unique: true)
    create index(:words, [:word, :secret])
  end

  def down do
    drop table(:words)
  end
end
