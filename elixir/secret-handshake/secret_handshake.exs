defmodule SecretHandshake do
  import Enum, only: [zip: 2, reduce: 3, reverse: 1]

  @acts ["wink", "double blink", "close your eyes", "jump"]

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    Integer.digits(code, 2)
    |> to_shake
    |> reverse
  end

  defp add_shake({_, 0}, acc), do: acc
  defp add_shake({a, 1}, acc), do: [a | acc]

  defp to_shake([e]), do: reduce(zip(@acts, [e]), [], &add_shake/2)
  defp to_shake([d, e]), do: reduce(zip(@acts, [e, d]), [], &add_shake/2)
  defp to_shake([c, d, e]), do: reduce(zip(@acts, [e, d, c]), [], &add_shake/2)
  defp to_shake([b, c, d, e]), do: reduce(zip(@acts, [e, d, c, b]), [], &add_shake/2)

  defp to_shake([1, b, c, d, e]) do
    reverse(@acts)
    |> zip([b, c, d, e])
    |> reduce([], &add_shake/2)
  end

  defp to_shake(_), do: []
end
