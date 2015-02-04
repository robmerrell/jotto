defmodule MixWordsTest do
  use ExUnit.Case, async: false

  import Mix.Tasks.Words.Insert

  test "insert_words should insert both guess and secret words into the database" do
    Jotto.Repo.delete_all Jotto.Word
    run []

    words = Jotto.Repo.all Jotto.Word
    assert 4 == Enum.count(words)
  end

end
