defmodule JottoTest do
  use ExUnit.Case

  test "has_dupe_letters should return true if there are duplicate letters" do
    res = Mix.Tasks.Words.Insert.contains_dupe_letters? "queen"
    assert res
  end

  test "has_dupe_letters should return false if there are no duplicate letters" do
    res = Mix.Tasks.Words.Insert.contains_dupe_letters? "quiet"
    refute res
  end
end
